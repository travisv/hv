class Client < ActiveRecord::Base
  has_many :homevisits, dependent: :destroy
  validates :name, presence: true
  validates :titleXIX, presence: true, format: { with: /\d\d\d\d\d\d\d[A-Z]/  },
            uniqueness: true
end
