class ProductsController < ApplicationController
  def index
    @products = Product.order(name: :asc)
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new.build_ingredients(new_ingredients)
  end

  def edit
    @product = Product.find(params[:id]).build_ingredients(new_ingredients)
  end

  def create
    @product = Product.new
    if @product.update_attributes(product_params)
      redirect_to(
        products_url,
        flash: { success: 'Product was successfully created.' }
      )
    else
      render :new
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      redirect_to(
        products_url,
        flash: { success: 'Product was successfully updated.' }
      )
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to(
      products_url,
      flash: { success: 'Product was successfully removed.' }
    )
  end

  private

  def product_params
    params.require(:product).permit(
      :name,
      :description,
      ingredient_configurations_attributes: [:id, :ingredient_id, :quantity]
    )
  end

  def new_ingredients
    params[:new_ingredients].to_i
  end
end
