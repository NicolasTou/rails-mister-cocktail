class CocktailsController < ApplicationController
  before_action :set_cocktails, only: [:show, :edit, :update, :destroy]
  def index
    @cocktails = Cocktail.all
  end

  def show
  end

  def new
    @cocktail = Cocktail.new
  end

  def edit
  end

  def create
    @cocktail = Cocktail.new(cocktails_param)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render "new"
    end
  end

  def update
    if @cocktail.update(cocktail_params)
      redirect_to cocktails_path
    else
      render "edit"
    end
  end

  def destroy
    @coctail.destroy
  end

  private

  def set_cocktails
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktails_param
    params.require(:cocktail).permit(:name)
  end
end
