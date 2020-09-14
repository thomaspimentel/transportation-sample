class VehicleMake
  include Mongoid::Document
  field :name, type: String
  field :active, type: Boolean, default: true

  validates :name,  presence: true,
                    uniqueness: { case_sensitive: false }
end
