# == Schema Information
#
# Table name: notes
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  client_id   :integer
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Note < ActiveRecord::Base
  belongs_to :user
  belongs_to :client

  def pretty_time
    created_at.strftime("%A, %b %d")
  end
end
