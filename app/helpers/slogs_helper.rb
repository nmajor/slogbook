module SlogsHelper

  def slog_thumb( slog )
    if slog.slog_blocks[0].image_url(:thumb)
      return slog.slog_blocks[0].image_url(:thumb).to_s
    else
      return holder_tag "100x100", "No Featured Image"
    end
  end
  
  def slog_image( slog )
    if slog.slog_blocks[0].image_url
      return image_tag slog.slog_blocks[0].image_url
    else
      return holder_tag "260x260", "No Featured Image"
    end
  end
  
  def link_to_add_block( name, f )
    new_slog_block = f.object.send(:slog_blocks).klass.new
    id = new_slog_block.object_id
    fields = f.fields_for :slog_blocks, new_slog_block, child_index: id do |builder|
      render 'slog_block_form', f: builder
    end
    link_to name, '#', class: "add_block", data: { id: id, fields: fields.gsub('\n', '') }
  end

end
