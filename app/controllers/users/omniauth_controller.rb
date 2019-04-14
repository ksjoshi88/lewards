class Users::OmniauthController < Devise::OmniauthCallbacksController

  # facebook callback
  def facebook
    @user = User.create_from_provider_data(request.env['omniauth.auth'])
    if @user.persisted?
      set_user_profile(@user,request.env['omniauth.auth'])
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
    else
      flash[:error] = 'There was a problem signing you in through Facebook. Please register or try signing in later.'
      redirect_to new_user_registration_url
    end
  end

  # google callback
  def google_oauth2
    @user = User.create_from_provider_data(request.env['omniauth.auth'])
    if @user.persisted?
      set_user_profile(@user,request.env['omniauth.auth'] )
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
    else
      flash[:error] = 'There was a problem signing you in through Google. Please register or try signing in later.'
      redirect_to new_user_registration_url
    end
  end

  # failure callback
  def failure
    flash[:error] = 'There was a problem signing you in. Please register or try signing in later.'
    redirect_to new_user_registration_url
  end

  #setting profile of the user
  def set_user_profile(user, provider_data)
    if user.profile.nil?
      profile = Profile.new
      profile.user_id = user.id
      names = provider_data.extra.raw_info.name.split(' ')
      profile.first_name = names[0]
      profile.last_name = names[1]
      profile.save
    end
  end
end
