class OrdersController < ApplicationController
  def index
    @orders = Order.order(created_at: :desc)
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new.build_products(new_products)
  end

  def edit
    @order = Order.find(params[:id]).build_products(new_products)
  end

  def create
    @order = Order.new
    if @order.update_attributes(order_params)
      redirect_to(
        orders_url,
        flash: { success: 'Order was successfully created.' }
      )
    else
      render :new
    end
  end

  def update
    @order = Order.find(params[:id])
    if @order.update_attributes(order_params)
      redirect_to(
        orders_url,
        flash: { success: 'Order was successfully updated.' }
      )
    else
      render :edit
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to(
      orders_url,
      flash: { success: 'Order was successfully removed.' }
    )
  end

  private

  def order_params
    params.require(:order).permit(
      :description,
      product_configurations_attributes: [:id, :product_id, :quantity]
    )
  end

  def new_products
    params[:new_products].to_i
  end
end
