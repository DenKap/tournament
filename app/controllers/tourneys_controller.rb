class TourneysController < ApplicationController
  before_action :set_tourney, only: %i[join_tourney leave_tourney]
  before_action :set_team, only: %i[join_tourney leave_tourney]

  def index
    @tourneys = Tourney.all.includes(:participants).order(created_at: :desc).paginate(page: params[:page], per_page: 6)
  end

  def join_tourney
    participant = Participant.create(team_id: @team_id, tourney_id: @tourney.id)
    if participant.save
      redirect_to tourneys_path, notice: "Your joined #{@tourney.name}"
    else
      redirect_to tourneys_path, alert: "You have already joined the #{@tourney.name}"
    end
  end

  def leave_tourney
    participant = Participant.find_by(team_id: @team_id, tourney_id: @tourney.id)
    if participant.destroy
      redirect_to tourneys_path, notice: "Your leaved #{@tourney.name}"
    else
      redirect_to root_path, alert: "Couldn't leave #{@tourney.name}"
    end
  end

  private

  def set_team
    @team_id = Team.find_by(team_owner_id: @current_user.id).id
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: 'Team not found'
  end

  def set_tourney
    @tourney = Tourney.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: 'Tournament not found'
  end
end
