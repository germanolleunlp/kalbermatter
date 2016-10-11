class ProductConfigurationsController < ApplicationController
  helper_method :product_configuration

  def destroy
    product_configuration.destroy
    redirect_to(
      edit_order_path(product_configuration.order),
      flash: { success: "Product was successfully removed." }
    )
  end

  private

  def product_configuration
    @product_configuration ||= ProductConfiguration.find(params[:id])
  end
end
