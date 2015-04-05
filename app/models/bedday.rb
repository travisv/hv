class Bedday < ActiveRecord::Base
  belongs_to :client, dependent: :destroy
end
