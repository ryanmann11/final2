class CasesController < ApplicationController
  skip_before_action :require_user, only: [:index, :show]

  def index
    @cases = Case.all
  end

  def show
    @case = Case.find_by(id: params["id"])
    @giver = Giver.all
  end

  def edit
    @case = Case.find_by(id: params["id"])
  end

  def new
    @case = Case.new
  end

  def create
    case_params = params.require(:case).permit(:name)
    @case = Case.create(case_params)
    @giver = @case.giver
    redirect_to givers_path
end

  def update
    case_params = params.require(:case).permit!
    @case = Case.find_by(id: params["id"])
    @case.update(case_params)
    if @case.valid?
      redirect_to cases_path
    else
      render text: "Uh oh! Problemo! Try again, please!"
    end
  end

  def destroy
    @case = Case.find_by(id: params["id"])
    @case.destroy
    redirect_to cases_path
  end

end