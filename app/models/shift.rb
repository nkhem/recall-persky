# == Schema Information
#
# Table name: shifts
#
#  id                   :integer          not null, primary key
#  contiguous_timing_id :integer          not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  start_datetime       :datetime
#  end_datetime         :datetime
#

class Shift < ApplicationRecord
  validates :contiguous_timing_id, :start_datetime, :end_datetime, presence: true

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

  # has_one :date,
  #   through: :contiguous_timing,
  #   source: :date

end
