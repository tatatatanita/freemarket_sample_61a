class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_from :facebook
  end

  def google_oauth2
    callback_from :google
  end
 
  private
 
  def callback_from(provider)
    provider = provider.to_s
 
    @user = User.find_for_oauth(request.env['omniauth.auth'])
    if @user.persisted?
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.provider_data"] = request.env['omniauth.auth'].except("extra")
      redirect_to step1_signup_index_url(provider)
    end
  end
end