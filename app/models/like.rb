# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#  video_id   :bigint           not null
#
# Indexes
#
#  index_likes_on_user_id               (user_id)
#  index_likes_on_video_id              (video_id)
#  index_likes_on_video_id_and_user_id  (video_id,user_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#  fk_rails_...  (video_id => videos.id)
#
class Like < ApplicationRecord
  belongs_to :user
  belongs_to :video

  validates :user_id, uniqueness: { scope: :video_id }
end
