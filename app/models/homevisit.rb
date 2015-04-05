class Homevisit < ActiveRecord::Base
  belongs_to :client
  validates :client_id, presence: true
  validates :departure_date, presence: true
  validates :return_date, presence: true

  scope :client_hvs, -> (client) { where(client_id: client) }

  def days
    (self.return_date - self.departure_date).to_i
  end
end
