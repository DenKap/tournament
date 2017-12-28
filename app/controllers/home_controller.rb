class HomeController < ApplicationController
  def index
    @teams = Team.all.order(created_at: :desc).paginate(page: params[:page], per_page: 20)
  end
end
