class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredients = Ingredient.all
    @ingredient = Ingredient.find(params[:dose][:ingredient_id])
    @dose = Dose.new(dose_params)
    @dose.ingredient = @ingredient
    if @dose.save
      redirect_to cocktail_path(params[:cocktail_id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def dose_params
    params.require(:dose).permit(:description)
  end
end
