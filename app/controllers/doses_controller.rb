class DosesController < ApplicationController
#CREATE-------------------------------------------------------------------------
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

#DESTROY------------------------------------------------------------------------
  def destroy
    @dose = Dose.find(params[:id])
    @dose.delete


    redirect_to cocktail_path(@dose.cocktail)
  end

#EXTRA--------------------------------------------------------------------------
  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
