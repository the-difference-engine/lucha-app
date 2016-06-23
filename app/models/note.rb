class Note < ActiveRecord::Base
  belongs_to :user
  belongs_to :client

  def pretty_time
    created_at.strftime("%A, %b %d")
  end
end
