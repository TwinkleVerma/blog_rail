module WelcomeHelper
  
  def get_user_image(user)
    user_image = user.image
    if user_image.picture_url != nil
      user_image.picture_url
    else
      "/assets/man.png"
    end
  end

end
