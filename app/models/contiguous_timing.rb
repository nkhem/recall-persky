# == Schema Information
#
# Table name: contiguous_timings
#
#  id         :integer          not null, primary key
#  event_id   :integer          not null
#  user_id    :integer
#  date       :integer          not null
#  start_time :integer          not null
#  end_time   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ContiguousTiming < ApplicationRecord
  validates :event_id, :date, :start_time, :end_time, presence: true
  validates :start_time, :end_time, :inclusion => { :in => 0..2400 },
    :message => "Invalid time. Must be between 0 and 2400."

  belongs_to :event

  belongs_to :organizer,
    class_name: "User",
    foreign_key: "user_id"

  has_many :volunteers,
    through: :shifts,
    source: :volunteers

  has_many :shifts

end
