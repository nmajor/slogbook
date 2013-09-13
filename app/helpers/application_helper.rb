module ApplicationHelper
  def big_user_avatar( user)
    if user.avatar_url
       return image_tag user.avatar_url.to_s
    else
      if user.gender == 'm'
        return image_tag "avatars/grey_elder.jpg"
      else
        return image_tag "avatars/grey_sister.jpg"
      end
    end
  end
end
