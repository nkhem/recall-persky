# == Schema Information
#
# Table name: users_shifts
#
#  id       :integer          not null, primary key
#  user_id  :integer          not null
#  shift_id :integer          not null
#

class UsersShift < ApplicationRecord
  validates :user_id, :shift_id, presence: true

  belongs_to :volunteer,
    class_name: "User",
    foreign_key: "user_id"

  belongs_to :shift
end
