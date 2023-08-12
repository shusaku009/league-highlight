# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :text(65535)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#  video_id   :bigint           not null
#
# Indexes
#
#  index_comments_on_user_id   (user_id)
#  index_comments_on_video_id  (video_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#  fk_rails_...  (video_id => videos.id)
#
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :video

  validates :body, presence: true, length: { maximum: 1000 }

  def self.ransackable_attributes(_auth_object = nil)
    %w[id body created_at updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[user video]
  end
end
