class IngredientsController < ApplicationController
  helper_method :ingredient, :ingredients

  def index; end

  def show; end

  def new; end

  def edit; end

  def create
    if ingredient.update_attributes(ingredient_params)
      redirect_to(
        ingredients_url,
        flash: { success: 'Ingredient was successfully created.' }
      )
    else
      render :new
    end
  end

  def update
    if ingredient.update_attributes(ingredient_params)
      redirect_to(
        ingredients_url,
        flash: { success: 'Ingredient was successfully updated.' }
      )
    else
      render :edit
    end
  end

  def destroy
    ingredient.destroy
    redirect_to(
      ingredients_url,
      flash: { success: 'Ingredient was successfully removed.' }
    )
  end

  private

  def ingredient
    @ingredient ||= params[:id] ? Ingredient.find(params[:id]) : Ingredient.new
  end

  def ingredients
    @ingredients ||= Ingredient.order(name: :asc)
  end

  def ingredient_params
    params.fetch(:ingredient, {}).permit(:name, :description, :quantity)
  end
end
