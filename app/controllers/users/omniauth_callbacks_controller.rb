class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    handle_auth('facebook')
  end

  def google_oauth2
    handle_auth('google_oauth2')
  end

  private

  def handle_auth(kind)
    if service.present?
      service.update(service_attrs)
    else
      user.services.create(service_attrs)
    end

    if user_signed_in?
      flash[:notice] = "Successfully added #{kind} to your account"
      redirect_to edit_user_registration_path
    else
      sign_in_and_redirect user, event: :authentication
      flash[:notice] = "Successfully logged in through #{kind}"
    end

  end

  def auth
    request.env['omniauth.auth']
  end

  def set_service
    @service = Service.where(provider: auth.provider, uid: auth.uid).first
  end


  def set_user
    # if user sign_in to connect things
    # if user sign_out to create profile
    # if user sing_out and profile already exists
    if user_signed_in?
      @user = current_user
    elsif service.present?
      @user = service.user
    elsif User.where(email: auth.info.email).any?
      flash[:alert] = "You already have profile in our website. Please login throw another social network and connect #{auth.provider} to your account"
      redirect_to new_user_registration_path
    else
      @user = User.create!(create_user)
    end
  end

  def service_attrs
    expires_at = auth.credentials.expires_at.present? ? Time.at(auth.credentials.expires_at) : nil
    {
      provider: auth.provider,
      uid: auth.uid,
      expires_at: expires_at,
      access_token: auth.credentials.token
    }
  end

  def create_user
    {
      first_name: auth.info.first_name,
      last_name: auth.info.last_name,
      email: auth.info.email,
      password: Devise.friendly_token[0, 20]
    }
  end


end
