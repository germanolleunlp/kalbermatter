class Users::SessionsController < Devise::SessionsController
  private

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || orders_path
  end
end
