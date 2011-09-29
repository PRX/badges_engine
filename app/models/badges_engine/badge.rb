module BadgesEngine
  class Badge < ActiveRecord::Base
    
    include BadgesEngine::Engine.routes.url_helpers
    
    has_many :assertions
    
    validates_uniqueness_of :name

    before_validation(:on=>:create) do
      self.version ||= BadgesEngine::Configuration.badge_version
    end

    def issuer
      BadgesEngine::Configuration.issuer
    end
    
    def criteria
      read_attribute(:criteria).blank? ? badge_path(self) : read_attribute(:criteria)
    end
    
  end
end
