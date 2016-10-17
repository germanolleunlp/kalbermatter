class IngredientConfigurationsController < ApplicationController
  def destroy
    IngredientConfiguration.find(params[:id]).destroy
    flash[:success] = 'Ingredient was successfully removed.'
    redirect_to referring_index_path
  end

  private

  def referring_index_path
    "/#{Rails.application.routes.recognize_path(request.referrer)[:controller]}"
  end
end
