class Event
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated

  field :name, type: String
  field :start_date, type: Date
  field :end_date, type: Date
  field :address, type: String
  field :city, type: String
  field :state, type: String
  field :postal_code, type: String
  field :country, type: String
  field :address_two, type: String
  field :active, type: Boolean, default: true

  validates :name,  presence: true,
                    uniqueness: true
  validates :start_date,  presence: true
  validate  :end_date_after_start_date?

  def full_address
    return "#{address} #{city} #{state} #{postal_code} #{country}"
  end

  def end_date_after_start_date?
    return if [end_date.blank?, start_date.blank?].any?
    if end_date < start_date
      errors.add(:end_date, "can not be before start_date")
    end
  end
end
