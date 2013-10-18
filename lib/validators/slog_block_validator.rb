class SlogBlockValidator < ActiveModel::Validator
  def validate(record)
    if record.slog_blocks[0].image.to_s == '' || record.slog_blocks[0].body == ''
      record.errors[:base] << "The first block needs to have both an image and text"
    end
  end
end