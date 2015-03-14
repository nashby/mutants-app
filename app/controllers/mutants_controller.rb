class MutantsController < ApplicationController
  before_action :set_mutant, only: [:show, :edit, :update, :destroy]

  def index
    @mutants = Mutant.all
  end

  def show
    # just to know there's show action
  end

  def new
    @mutant = Mutant.new
  end

  def edit
    # just to know there's edit action
  end

  def create
    @mutant = Mutant.create(mutant_params)

    respond_with @mutant
  end

  def update
    @mutant.update_attributes(mutant_params)

    respond_with @mutant
  end

  def destroy
    @mutant.destroy

    respond_with @mutant
  end

  protected

  def mutant_params
    params.require(:mutant).permit(:name, :description, team_ids: [])
  end

  def set_mutant
    @mutant = Mutant.find(params[:id])
  end
end
