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
  # 
  # belongs_to :event
  #
  # belongs_to :organizer,
  #   class_name: "User",
  #   foreign_key: "user_id"
  #
  # has_many :volunteers,
  #   through: :users_shift,
  #   source: :volunteer
  #
  # has_many :shifts
end
