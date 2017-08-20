class CocktailsController < ApplicationController

before_action :set_cocktail, only: [:show, :edit, :update]

  def index
    @cocktails = Cocktail.all
  end

  def create
     @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def new
    @cocktail = Cocktail.new
  end

  def edit
    # Not required
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @doses = Dose.where(cocktail_id: params[:id])
    @dose = Dose.new
  end

  def update
    # Not required

    # @cocktail.update(cocktail_params)
    # redirect_to cocktail_path(@cocktail)
  end

  def destroy
    # Not required
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

end

#        Prefix Verb   URI Pattern                   Controller#Action
#     cocktails GET    /cocktails(.:format)          cocktails#index
#               POST   /cocktails(.:format)          cocktails#create
#  new_cocktail GET    /cocktails/new(.:format)      cocktails#new
# edit_cocktail GET    /cocktails/:id/edit(.:format) cocktails#edit
#      cocktail GET    /cocktails/:id(.:format)      cocktails#show
#               PATCH  /cocktails/:id(.:format)      cocktails#update
#               PUT    /cocktails/:id(.:format)      cocktails#update
#               DELETE /cocktails/:id(.:format)      cocktails#destroy
