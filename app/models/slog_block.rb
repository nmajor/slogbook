class SlogBlock < ActiveRecord::Base
  attr_accessible :image, :body, :image_cache, :remove_image
  belongs_to :slog
  mount_uploader :image, ImageUploader
end
