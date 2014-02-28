# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)      not null
#  password_digest :string(255)      not null
#  session_token   :string(255)      not null
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  attr_reader :password

  validates :password_digest, :username, :session_token, presence: true
  validates :password, length: {minimum: 6, allow_nil: true}
  validates :password, presence: true, on: :create

  before_validation :ensure_session_token

  has_many :links, :foreign_key => :submitter_id
  has_many :subs, :foreign_key => :moderator_id
  has_many :comments, :foreign_key => :author_id
  has_many :user_votes, :foreign_key => :voter_id
  has_many :voted_link, :through => :user_votes, :source => :vote

  def password=(pt)
    @password = pt
    self.password_digest = BCrypt::Password.create(pt)
  end

  def is_password?(pt)
    BCrypt::Password.new(self.password_digest).is_password?(pt)
  end

  def self.generate_session_token
    SecureRandom.urlsafe_base64
  end

  def self.find_by_credentials(params)
    user = User.find_by(username: params[:username])
    user.try(:is_password?, params[:password]) ? user : nil
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

end
