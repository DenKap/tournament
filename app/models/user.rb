class User < ApplicationRecord
  has_one :team, foreign_key: 'team_owner_id'

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.nick = auth.info.nick
      user.email = auth.info.email
      user.token = auth.credentials.token
      user.refresh_token = auth.credentials.refresh_token
      user.token_expires_at = auth.credentials.expires_at
      user.save!
    end
  end

  def has_team?
    Team.where(team_owner_id: self.id).present?
  end

  def user_team_joined?(tourney)
    if self.has_team?
      Participant.find_by(team_id: self.team.id, tourney_id: tourney.id).present?
    else
      false
    end
  end
end
