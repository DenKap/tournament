class Participant < ApplicationRecord
  belongs_to :team
  belongs_to :tourney

  validates_uniqueness_of :team_id, scope: :tourney_id
end
