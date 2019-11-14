class CocktailsController < ApplicationController
#READ---------------------------------------------------------------------------
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end
#CREATE-------------------------------------------------------------------------
  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end
#EXTRA--------------------------------------------------------------------------
  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
