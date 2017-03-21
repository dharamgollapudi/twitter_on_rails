# :no-doc:
class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :authenticate_user!

  def twitter
    oauth_data = request.env['omniauth.auth']
    user = User.find_or_create_from_twitter(oauth_data)
    sign_in user
    redirect_to root_path, notice: 'Welcome Twitter User'
  end
end
