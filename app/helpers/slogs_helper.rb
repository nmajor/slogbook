module SlogsHelper

  def slog_thumb( slog )
    if slog.image_url(:thumb)
      return image_tag slog.image_url(:thumb).to_s
    else
      return holder_tag "100x100", "No Featured Image"
    end
  end
  
  def slog_image( slog )
    if slog.image_url
      return image_tag slog.image_url.to_s
    else
      return holder_tag "260x260", "No Featured Image"
    end
  end

end
