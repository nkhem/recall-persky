# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  f_name          :string           not null
#  l_name          :string           not null
#  email           :string           not null
#  phone_number    :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :f_name, :l_name, :email, :phone_number, presence: true
  validates :email, uniqueness: :true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
  validates :phone_number, format: { with: /((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}/i }
  validates :password, length: { minimum: 4, allow_nil: true }

  has_many :volunteer_shifts,
    through: :users_shifts,
    source: :shift

  has_many :organizer_shifts,
    through: :users_shifts,
    source: :shift

  #timings that this user is the organizer of
  has_many :contiguous_timings

  #events that this user is the organizer of at least one timing for
  has_many :organizer_events,
    through: :contiguous_timings,
    source: :event



  attr_reader :password

  after_initialize :ensure_session_token

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return nil unless user && user.valid_password?(password)
    user
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def valid_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.session_token
  end

  private

  def ensure_session_token
    reset_session_token! unless self.session_token
  end

end
