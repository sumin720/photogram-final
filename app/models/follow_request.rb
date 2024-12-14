# == Schema Information
#
# Table name: follow_requests
#
#  id           :bigint           not null, primary key
#  status       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  recipient_id :integer
#  sender_id    :integer
#
class FollowRequest < ApplicationRecord
  # Associations
  belongs_to :recipient, class_name: 'User'
  belongs_to :sender, class_name: 'User'

  # Validations
  validates :status, presence: true, inclusion: { in: %w[pending accepted rejected] }
  validates :recipient_id, presence: true
  validates :sender_id, presence: true
end
