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
end
