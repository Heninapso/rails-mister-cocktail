class DosesController < ApplicationController

  # before_action :set_dose, only: [:create, :destroy]

  def show
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail), notice: 'Dose successfully added!'
    else
      render 'cocktails/show'
    end
  end

  private

  # def set_dose
  #   @dose = Dose.find(params[:id])
  # end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

end
