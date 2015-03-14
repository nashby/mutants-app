class TeamsController < ApplicationController
  before_action :set_team, only: [:show]

  def index
    @teams = Team.all
  end

  def show
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.create(team_params)

    respond_with @team
  end

  protected

  def team_params
    params.require(:team).permit(:name, :description)
  end

  def set_team
    @team = Team.find(params[:id])
  end
end
