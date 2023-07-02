# == Schema Information
#
# Table name: teams
#
#  id                 :bigint           not null, primary key
#  name               :string(255)      not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  league_category_id :bigint           not null
#
# Indexes
#
#  index_teams_on_league_category_id  (league_category_id)
#
# Foreign Keys
#
#  fk_rails_...  (league_category_id => league_categories.id)
#
require 'rails_helper'

RSpec.describe Team, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
