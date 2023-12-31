# == Schema Information
#
# Table name: teams
#
#  id         :bigint           not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Team < ApplicationRecord
  has_many :videos, dependent: :destroy

  validates :name, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id name updated_at]
  end
end
