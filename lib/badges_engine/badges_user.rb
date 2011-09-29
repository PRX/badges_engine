module BadgesEngine
  
  module BadgesUser
    
    extend ActiveSupport::Concern
    
    included do
      has_many :assertions, :class_name=>'BadgesEngine::Assertion', :foreign_key=>:user_id
      has_many :badges, :through=>:assertions, :class_name=>'BadgesEngine::Badge'
    end

    module ClassMethods

    end

    module InstanceMethods
      
      def add_badge(badge_or_name)
        badge = badge_or_name.is_a?(BadgesEngine::Badge) ? badge_or_name : BadgesEngine::Badge.find_by_name(badge_or_name)
      end
      
    end
    
  end

end
