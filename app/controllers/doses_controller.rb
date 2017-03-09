class DosesController < ApplicationController

  # before_action :set_dose, only: [:create, :destroy]

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(params[:id])
  end

  def show
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredients = []
    ingredient = Ingredient.new(params[:dose_id])
    @ingredients << ingredient
    @dose = Dose.new(dose_params)
    if @dose.save
      redirect_to cocktail_path(@cocktail), notice: 'Dose successfully added!'
    else
      render :new
    end
  end

  private

  # def set_dose
  #   @dose = Dose.find(params[:id])
  # end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end

end
