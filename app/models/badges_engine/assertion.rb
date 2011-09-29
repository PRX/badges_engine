require 'uri'
require 'json'
require 'net/http'

module BadgesEngine
  class Assertion < ActiveRecord::Base

    include BadgesEngine::Engine.routes.url_helpers

    belongs_to :badge

    validates_presence_of :badge_id
    validates_presence_of :user_id

    # validates_associated :user, :badge
    validates_associated :badge

    before_validation(:on=>:create) do
      self.token = SecureRandom.urlsafe_base64(16)
    end

    after_commit :bake, :if => :update_assertion?

    class <<self
      def associate_user_class(user_class)
        belongs_to :user, :class_name=>user_class.to_s, :foreign_key=>'user_id'
      end
    end

    def recipient
      self.user.try(:email)
    end
    
    
    def update_assertion?
      persisted? && !is_baked?
    end
    
    def baking_callback_url
      origin_uri = URI.parse(BadgesEngine::Configuration.issuer.origin)
      secret_assertion_url(:id=>self.id, :token=>self.token, :host=>origin_uri.host)
    end
      
    def bake
      uri = URI.parse(BadgesEngine::Configuration.baker_url)
      http = Net::HTTP.new(uri.host, uri.port)
      path = "#{uri.path}?assertion=#{self.baking_callback_url}"
      headers = {'Content-Type'=>'application/json','Accept'=>'application/json'}
      logger.debug("request: #{uri.host}#{path}")
      response = http.get(path, headers)
      
      unless response.kind_of?(Net::HTTPSuccess)
        raise "Baking badge failed: Response was not a success:\n\t'#{response.inspect}'"
      end

      if !response || response.body.blank?
        raise "Baking badge failed: Response was blank:\n\t'#{response.inspect}'"
      end
      
      badges_response = ActiveSupport::JSON.decode(response.body)
      logger.debug("response: #{badges_response.inspect}")
      
      if badges_response['status'] == 'success'
        self.update_attribute(:is_baked, true)
      else
        raise "Baking badge failed:\n\tStatus:'#{badges_response['status']}'\n\tError:'#{badges_response['error']}'\n\tReason:'#{badges_response['reason']}'"
      end
    end
    
    def open_badges_as_json
      as_json(  :only=>[:evidence, :expires, :issued_on],
                :methods=>[:recipient],
                :include=>{ :badge=>{
                            :only=>[:version, :name, :image, :description, :criteria],
                            :methods=>:issuer} }
              )
    end
    
  end
end
