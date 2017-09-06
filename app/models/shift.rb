# == Schema Information
#
# Table name: shifts
#
#  id                   :integer          not null, primary key
#  contiguous_timing_id :integer          not null
#  start_time           :integer          not null
#  end_time             :integer          not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Shift < ApplicationRecord
  validates :contiguous_timing_id, :start_time, :end_time, presence: true
  validates :start_time, :end_time, :inclusion => { :in => 0..2400 },
    :message => "Invalid time. Must be between 0 and 2400."

  has_many :volunteers,
    through: :users_shifts,
    source: :volunteer

  belongs_to :contiguous_timing

  has_one :event,
    through: :contiguous_timing,
    source: :event

  has_one :organizer,
    through: :contiguous_timing,
    source: :organizer

  has_one :date,
    through: :contiguous_timing,
    source: :date

end
