module UsersHelper
  def avatar_thumb( user )
    if user.avatar_url(:thumb)
      return image_tag user.avatar_url(:thumb).to_s, title: user.username, width: '%100', height: 'auto'
    elsif ! user.avatar_url(:thumb)
      if user.gender == 'm' 
        return image_tag 'avatars/thumb_grey_elder.jpg'
      else
        return image_tag 'avatars/thumb_grey_sister.jpg'
      end
    end
  end
  def avatar( user )
    if user.avatar_url
      return image_tag user.avatar_url.to_s, title: user.username, width: '%100', height: 'auto', class: 'avatar'
    elsif ! user.avatar_url
      if user.gender == 'm' 
        return image_tag 'avatars/grey_elder.jpg', class: 'avatar'
      else
        return image_tag 'avatars/grey_sister.jpg', class: 'avatar'
      end
    end
  end
end
