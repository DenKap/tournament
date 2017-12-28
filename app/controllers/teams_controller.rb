class TeamsController < ApplicationController
  before_action :set_team, only: %i[edit update destroy show]
  before_action :check_access, only: %i[edit destroy]

  def show; end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @team.team_owner_id = @current_user.id
    if @team.save
      redirect_to root_path, notice: "Yor team #{@team.name} has been added"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @team.update(team_params)
      redirect_to root_path, notice: "#{@team.name} has been updated successfully"
    else
      render :edit
    end
  end

  def destroy
    if @team.destroy
      redirect_to root_path, notice: "Your team #{@team.name} has been removed"
    else
      redirect_to root_path, alert: "Couldn't delete #{@team.name}"
    end
  end

  private

  def set_team
    @team = Team.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: "Couldn't find this team"
  end

  def check_access
    redirect_to root_path unless @current_user.id == @team.team_owner_id
  end

  def team_params
    params.require(:team).permit(:name, :logo)
  end
end
