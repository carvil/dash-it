class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    @user = User.find_for_github_oauth(request.env["omniauth.auth"], current_user)

    if @user
      if @user.persisted?
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Github"
        sign_in_and_redirect @user, :event => :authentication
      else
        session["devise.github_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
    else
      flash[:error] = I18n.t "devise.omniauth_callbacks.noemail", :kind => "Github"
      redirect_to new_user_registration_url
    end
  end
end
