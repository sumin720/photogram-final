# == Schema Information
#
# Table name: photos
#
#  id             :bigint           not null, primary key
#  caption        :text
#  comments_count :integer
#  image          :string
#  likes_count    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  owner_id       :integer
#
class Photo < ApplicationRecord
  # Associations
  belongs_to :owner, class_name: 'User', counter_cache: :photos_count
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  # Validations
  validates :image, presence: true
  validates :owner_id, presence: true

  # Attach image using Active Storage
  has_one_attached :image
end

