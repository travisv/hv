class Bedday < ActiveRecord::Base
  belongs_to :client, dependent: :destroy

  def self.current_beddays(client)
    (client.bedday.remaining - Client.days_gone(client)).to_i
  end
end


