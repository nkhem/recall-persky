# == Schema Information
#
# Table name: contiguous_timings
#
#  id             :integer          not null, primary key
#  event_id       :integer          not null
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  start_datetime :datetime
#  end_datetime   :datetime
#

class ContiguousTiming < ApplicationRecord
  validates :event_id, :start_datetime, :end_datetime, presence: true

  belongs_to :event

  belongs_to :organizer,
    class_name: "User",
    foreign_key: "user_id"

  has_many :volunteers,
    through: :shifts,
    source: :volunteers

  has_many :shifts
end
