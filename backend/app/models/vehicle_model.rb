class VehicleModel
  include Mongoid::Document
  field :name, type: String
  field :active, type: Boolean, default: true
  belongs_to :vehicle_make

  validates :name,  presence: true,
                    uniqueness: { case_sensitive: false }
end
