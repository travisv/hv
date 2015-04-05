class Client < ActiveRecord::Base
  has_many :homevisits, dependent: :destroy
  has_one :bedday
  validates :name, presence: true
  validates :titleXIX, presence: true, format: { with: /\d\d\d\d\d\d\d[A-Z]/  },
            uniqueness: true
  before_save :create_bedday

  def create_bedday
    client = self.build_bedday
    client.save
  end

  def self.days_gone(client)
    time = []
    Homevisit.client_hvs(client).each do |hv|
      time << hv.return_date - hv.departure_date
    end
    (time.inject(:+)).to_i
  end
end
