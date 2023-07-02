# == Schema Information
#
# Table name: league_categories
#
#  id         :bigint           not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class LeagueCategory < ApplicationRecord
  has_many :teams, dependent: :destroy
end
