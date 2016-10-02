module ControllerMacros
  def login_user(user)
    @request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in user
  end

  def logout_user
    sign_out :user
  end
end
