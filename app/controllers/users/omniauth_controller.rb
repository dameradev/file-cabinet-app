class Users::OmniauthController < ApplicationController
  def github
  @user = User.create_from_github_data(request.env['omniauth.auth'])
  if @user.persisted?
    sign_in_and_redirect @user
    set_flash_message(:notice, :success, kind: 'Github') if is_navigational_format?
  else
    flash[:error] = 'There was a problem signing you in through Github. Please register or try signing in later.'
    redirect_to new_user_registration_url
  end
end
def facebook
  @user = User.create_from_provider_data(request.env['omniauth.auth'])
  if @user.persisted?
    sign_in_and_redirect @user
  else
    flash[:error] = 'There was a problem signing you in through Facebook. Please register or try signing in later.'
    redirect_to new_user_registration_url
  end
end
end
