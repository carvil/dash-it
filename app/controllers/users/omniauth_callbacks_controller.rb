class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def github
    @user = User.find_for_omniauth_oauth(request.env["omniauth.auth"], current_user)
    persist_user @user, "Github", "devise.github_data"
  end

  def facebook
    @user = User.find_for_omniauth_oauth(request.env["omniauth.auth"], current_user)
    persist_user @user, "Facebook", "devise.facebook_data"
  end

  private 

  def persist_user user, kind, session_name
    if user
      if user.persisted?
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", kind: kind
        sign_in_and_redirect user, :event => :authentication
      else
        session[session_name] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
    else
      flash[:error] = I18n.t "devise.omniauth_callbacks.noemail", kind: kind
      redirect_to new_user_registration_url
    end
  end
end
