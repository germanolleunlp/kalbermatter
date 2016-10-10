class OrdersController < ApplicationController
  helper_method :order, :orders

  def index; end

  def show; end

  def new; end

  def edit; end

  def create
    if order.update_attributes(order_params)
      redirect_to(
        orders_url,
        flash: { success: 'Order was successfully created.' }
      )
    else
      render :new
    end
  end

  def update
    if order.update_attributes(order_params)
      redirect_to(
        orders_url,
        flash: { success: 'Order was successfully updated.' }
      )
    else
      render :edit
    end
  end

  def destroy
    order.destroy
    redirect_to(
      order_url,
      flash: { success: 'Order was successfully destroyed.' }
    )
  end

  private

  def order
    @order ||= params[:id] ? Order.find(params[:id]) : Order.new
  end

  def orders
    @orders ||= Order.order(created_at: :desc)
  end

  def order_params
    params.fetch(:order, {}).permit(:name, :description)
  end
end
