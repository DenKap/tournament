class ParticipantsController < ApplicationController
  before_action :set_tourney

  def show
    @participants = @tourney.participants.all
  end

  private

  def set_tourney
    @tourney = Tourney.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: 'Tournament not found'
  end
end
