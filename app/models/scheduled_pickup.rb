class ScheduledPickup < ActiveRecord::Base
  belongs_to :delivery_zone

  validates :delivery_zone, presence: true
  validates :end_at, presence: true
  validates :start_at, presence: true

  delegate :zipcode, to: :delivery_zone

  def self.current
    where("start_at >= ?", Time.current.beginning_of_day)
  end

  def users
    []
  end
end
