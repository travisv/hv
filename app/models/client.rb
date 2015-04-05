class Client < ActiveRecord::Base
  has_many :homevisits, dependent: :destroy
  has_one :bedday
  validates :name, presence: true
  validates :titleXIX, presence: true, format: { with: /\d\d\d\d\d\d\d[A-Z]/  },
                       uniqueness: true
  before_save :create_bedday

  def hvs
    homevisits.all
  end

  def create_bedday
    client = build_bedday
    client.save
  end

  def days_gone
    time = []
    hvs.each do |hv|
      time << hv.return_date - hv.departure_date
    end
    (time.inject(:+)).to_i
  end

  def current_beddays
    (bedday.remaining - days_gone).to_i
  end
end
