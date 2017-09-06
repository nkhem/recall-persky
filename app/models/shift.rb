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

end
