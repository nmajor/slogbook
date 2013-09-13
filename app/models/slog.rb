class Slog < ActiveRecord::Base
  attr_accessible :body, :title, :user_id, :mission_id, :slog_type_id, :image,
    :image_cache, :remove_image, :remote_image_url, :tag_list
  acts_as_taggable_on :tags
  mount_uploader :image, ImageUploader
  belongs_to :user  
  belongs_to :slog_type
  belongs_to :mission
end
