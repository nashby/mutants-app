class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :destroy]

  def index
    @teams = Team.all
  end

  def show
    # just to know there's show action
  end

  def new
    @team = Team.new
  end

  def edit
    # just to know there's edit action
  end

  def create
    @team = Team.create(team_params)

    respond_with @team
  end

  def destroy
    @team.destroy

    respond_with @team
  end

  protected

  def team_params
    params.require(:team).permit(:name, :description, task_ids: [], mutant_ids: [])
  end

  def set_team
    @team = Team.find(params[:id])
  end
end
