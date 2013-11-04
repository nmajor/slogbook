module SlogsHelper

  def slog_thumb( slog )
    if slog.slog_blocks[0].image_url(:thumb)
      return image_tag slog.slog_blocks[0].image_url(:thumb).to_s, title: slog.tag_list.map { |t| t }.join(", "), width: '%100', height: 'auto'
    end
  end
  
  def slog_image( slog )
    if slog.slog_blocks[0].image_url
      return image_tag slog.slog_blocks[0].image_url.to_s
    end
  end
  
  def link_to_add_block( name, f )
    new_slog_block = f.object.send(:slog_blocks).klass.new
    id = new_slog_block.object_id
    fields = f.fields_for :slog_blocks, new_slog_block, child_index: id do |builder|
      render 'slog_block_form', f: builder
    end
    link_to name, '#', class: "add_block btn btn-primary", data: { id: id, fields: fields.gsub('\n', '') }
  end

  def upvote_slog( slog )
    if current_user && current_user.voted_as_when_voted_for(slog) == true
      return image_tag( asset_path('upblue.png'), alt: 'Upvote', class: 'upvote' )
    else 
      return link_to image_tag( asset_path('upgrey.png'), alt: 'Upvote', class: 'upvote' ), upvote_slog_path(slog), method: "post", remote: true
    end
  end
  
  def flag_slog( slog )
    if current_user && current_user.voted_as_when_voted_for(slog) == false
      return "Flagged as inappropriate"
    else 
      return link_to "Flag as inappropriate", flag_slog_path(slog), method: "post", remote: true
    end
  end
  
end
