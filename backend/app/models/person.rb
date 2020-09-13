class Person
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated

  field :first_name,    type: String
  field :last_name,     type: String
  field :email,         type: String
  field :date_of_birth, type: Date
  field :phone_number,  type: String
  field :active,        type: Boolean, default: true
  
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates :email, presence: true,
                    uniqueness: {case_sensitive: false}
end
