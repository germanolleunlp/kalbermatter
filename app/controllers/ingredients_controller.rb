class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.order(name: :asc)
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def new
    @ingredient = Ingredient.new
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def create
    @ingredient = Ingredient.new
    if @ingredient.update_attributes(ingredient_params)
      redirect_to(
        ingredients_url,
        flash: { success: 'Ingredient was successfully created.' }
      )
    else
      render :new
    end
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.update_attributes(ingredient_params)
      redirect_to(
        ingredients_url,
        flash: { success: 'Ingredient was successfully updated.' }
      )
    else
      render :edit
    end
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy
    redirect_to(
      ingredients_url,
      flash: { success: 'Ingredient was successfully removed.' }
    )
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :description, :quantity)
  end
end
