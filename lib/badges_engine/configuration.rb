module BadgesEngine

  module Configuration

    # Configure Cornerstone. Run rails generate cornerstone_install to create
    # a fresh initializer with all configuration values.
    
    class << self
      def setup
        yield self
      end
      
      attr_reader :issuer, :user_class
      attr_accessor :baker_url, :badges_origin, :badge_version

      def issuer=(attrs)
        @issuer = BadgesEngine::Issuer.new(attrs)
      end

      def user_class=(klass)
        @user_class = klass
      end

    end

  end

end

