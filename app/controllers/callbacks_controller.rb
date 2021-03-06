class CallbacksController < Devise::OmniauthCallbacksController
  def facebook
    logger.debug "Facebook Authentication"
    @user = User.from_omniauth(request.env["omniauth.auth"])
    session["devise.facebook_data"] = env["omniauth.auth"].except('extra')
    sign_in_and_redirect @user
  end
  def google_oauth2
    logger.debug "Google Authentication"
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect @user
  end
end