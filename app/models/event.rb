# == Schema Information
#
# Table name: events
#
#  id              :integer          not null, primary key
#  title           :string           not null
#  street_address1 :string           not null
#  street_address2 :string           default(""), not null
#  city            :string           not null
#  event_url       :string           default(""), not null
#  img_url         :string           default(""), not null
#  public_details  :string           default(""), not null
#  private_notes   :string           default(""), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require "byebug"
class Event < ApplicationRecord
  validates :title, :street_address1, :city, presence: true

  has_many :contiguous_timings
  #
  # has_many :start_datetimes,#TODO:how to make this into dates?
  #   through: :contiguous_timings,
  #   source: :start_datetime

  has_many :shifts,
    through: :contiguous_timings,
    source: :shifts

  has_many :volunteers,
    through: :contiguous_timings,
    source: :volunteers

  has_many :organizers,
    through: :contiguous_timings,
    source: :organizer

  # contiguous_timings is an array of [start_datetime, end_datetime] pairs
  def create_shifts(contiguous_timings)
    contiguous_timings.each{|timing| create_shift(timing)}
  end

  # contiguous_timing is a [start_datetime, end_datetime] pair
  def create_shift(contiguous_timing)
    debugger
    ContiguousTiming.new({
      event_id: self.id
    })
  end
end
