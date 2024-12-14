# == Schema Information
#
# Table name: users
#
#  id                 :bigint           not null, primary key
#  comments_count     :integer
#  email              :string
#  encrypted_password :string
#  likes_count        :integer
#  private            :boolean
#  username           :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
class User < ApplicationRecord
  has_many :photos, foreign_key: "owner_id"
  has_many :comments, foreign_key: "author_id"
  has_many :likes, foreign_key: "fan_id"
  has_many :follow_requests_as_sender, class_name: "FollowRequest", foreign_key: "sender_id"
  has_many :follow_requests_as_recipient, class_name: "FollowRequest", foreign_key: "recipient_id"

  def pending_follow_requests
    follow_requests_as_recipient.where(status: 'pending')
  end

  def follows?(other_user)
    follow_requests_as_sender.exists?(recipient_id: other_user.id, status: 'accepted')
  end
end

