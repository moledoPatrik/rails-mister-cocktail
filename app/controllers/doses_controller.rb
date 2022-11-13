class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def create
    @dose = Dose.new(dose_description)
    @ingredient = Ingredient.find(dose_ingredient[:ingredient_id])
    @dose.ingredient = @ingredient
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def dose_description
    params.require(:dose).permit(:description)
  end

  def dose_ingredient
    params.require(:dose).permit(:ingredient_id)
  end
end
