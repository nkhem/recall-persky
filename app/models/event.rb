# == Schema Information
#
# Table name: events
#
#  id              :integer          not null, primary key
#  title           :string           not null
#  street_address1 :string           not null
#  street_address2 :string
#  city            :string           not null
#  event_url       :string           not null
#  img_url         :string           not null
#  public_details  :string           not null
#  private_notes   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Event < ApplicationRecord
  validates :title, :street_address1, :city, presence: true

  has_many :contiguous_timings
  
  has_many :dates,
  through: :contiguous_timings,
  source: :date

  has_many :shifts,
    through: :contiguous_timings,
    source: :shifts

  has_many :volunteers,
    through: :contiguous_timings,
    source: :volunteers

  has_many :organizers,
    through: :contiguous_timings,
    source: :organizer
end
