require 'jquery-rails'

module BadgesEngine
  class Engine < Rails::Engine
    isolate_namespace BadgesEngine
    engine_name 'badges'
    
    ActiveRecord::Base.include_root_in_json = false
    
    config.generators do |g|
      g.orm             :active_record
      g.test_framework  :rspec, :views => false, :fixture => true
      g.template_engine :haml
    end

    config.to_prepare do
      user_class = BadgesEngine::Configuration.user_class
      if user_class
        BadgesEngine::Assertion.associate_user_class(user_class)
        user_class.send(:include, BadgesEngine::BadgesUser)
      else
        Rails.logger.warn "No BadgesEngine::Configuration.user_class defined."
      end
    end
    
  end
end
