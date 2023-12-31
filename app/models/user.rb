# == Schema Information
#
# Table name: users
#
#  id                                  :bigint           not null, primary key
#  access_count_to_reset_password_page :integer          default(0)
#  avatar                              :string(255)
#  crypted_password                    :string(255)
#  email                               :string(255)      not null
#  reset_password_email_sent_at        :datetime
#  reset_password_token                :string(255)
#  reset_password_token_expires_at     :datetime
#  role                                :integer          default("general"), not null
#  salt                                :string(255)
#  user_name                           :string(255)      not null
#  created_at                          :datetime         not null
#  updated_at                          :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_user_name             (user_name) UNIQUE
#
class User < ApplicationRecord
  authenticates_with_sorcery!

  mount_uploader :avatar, AvatarUploader
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_videos, through: :likes, source: :video
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_videos, through: :bookmarks, source: :video

  validates :user_name, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, length: { minimum: 4 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :reset_password_token, presence: true, uniqueness: true, allow_nil: true

  # 一般ユーザーか管理者の判別
  enum role: { general: 0, admin: 1 }

  def owner?(object)
    object.user_id == id
  end

  def like(video)
    like_videos << video
  end

  def unlike(video)
    like_videos.destroy(video)
  end

  def like?(video)
    like_videos.include?(video)
  end

  def bookmark(video)
    bookmark_videos << video
  end

  def unbookmark(video)
    bookmark_videos.destroy(video)
  end

  def bookmark?(video)
    bookmark_videos.include?(video)
  end
end
