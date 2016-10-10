class ProductsController < ApplicationController
  helper_method :product, :products

  def index; end

  def show; end

  def new; end

  def edit; end

  def create
    if product.update_attributes(product_params)
      redirect_to(
        products_url,
        flash: { success: 'Product was successfully created.' }
      )
    else
      render :new
    end
  end

  def update
    if product.update_attributes(product_params)
      redirect_to(
        products_url,
        flash: { success: 'Product was successfully updated.' }
      )
    else
      render :edit
    end
  end

  def destroy
    product.destroy
    redirect_to(
      products_url,
      flash: { success: 'Product was successfully destroyed.' }
    )
  end

  private

  def product
    @product ||= params[:id] ? Product.find(params[:id]) : Product.new
  end

  def products
    @products ||= Product.order(name: :asc)
  end

  def product_params
    params.fetch(:product, {}).permit(:name, :description)
  end
end
