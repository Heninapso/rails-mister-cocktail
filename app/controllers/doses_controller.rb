class DosesController < ApplicationController

  def show
    @cocktail = Cocktail.find(params[:cocktail_id])
    @doses = Dose.find(params[:id])
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail), notice: 'Dose successfully deleted!'
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

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

end
