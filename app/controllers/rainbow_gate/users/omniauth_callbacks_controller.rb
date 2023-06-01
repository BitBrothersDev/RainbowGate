# frozen_string_literal: true

class RainbowGate::Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # skip_before_action :verify_authenticity_token

  def google_oauth2
    user = RainbowGate::User.from_omniauth(auth)

    if user.present?
      sign_out_all_scopes
      flash[:success] = 'Success login'
      sign_in_and_redirect user, event: :authentication
    else
      flash[:alert] = "Login fail #{auth.info.email}"
      redirect_to new_plugin_authentication_user_session_path
    end
  end
  # More info at:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end

  private

  def auth
    @auth ||= request.env['omniauth.auth']
  end
end
