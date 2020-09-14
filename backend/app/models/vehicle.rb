class Vehicle
  include Mongoid::Document
  extend Enumerize
  field :username, type: String
  field :year, type: Integer
  field :license, type: String
  field :color, type: String
  field :rider_capacity, type: Integer
  field :status
  enumerize :status, in: [:active, :inactive, :deleted], default: :active
  belongs_to :event

  validates :username,  presence:true,
                        uniqueness: { case_sensitive: false }
  validates :year,     allow_nil: true,
                        inclusion: { in: 1900..Date.today.year },
                        format: { 
                          with: /(19|20)\d{2}/i, 
                          message: "should be a four-digit year"
                        }
end
