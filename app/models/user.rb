# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  comments_count         :integer
#  email                  :string
#  encrypted_password     :string
#  likes_count            :integer
#  private                :boolean
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
class User < ApplicationRecord
  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_many :photos, foreign_key: 'owner_id', dependent: :destroy
  has_many :comments, foreign_key: 'author_id', dependent: :destroy
  has_many :likes, foreign_key: 'fan_id', dependent: :destroy
  has_many :sent_follow_requests, class_name: 'FollowRequest', foreign_key: 'sender_id', dependent: :destroy
  has_many :received_follow_requests, class_name: 'FollowRequest', foreign_key: 'recipient_id', dependent: :destroy

  has_many :following_users, through: :sent_follow_requests, source: :recipient
  has_many :followers, through: :received_follow_requests, source: :sender

  # Validations
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
end

