module BadgesEngine
  class Issuer
    include ActiveModel::Validations
    include ActiveModel::Serialization

    validates_presence_of :origin, :name

    attr_accessor :origin, :name, :org, :contact

    def initialize(attrs={})
      @origin   = attrs[:origin]
      @name     = attrs[:name]
      @org      = attrs[:org]
      @contact  = attrs[:contact]
    end

  end
end
