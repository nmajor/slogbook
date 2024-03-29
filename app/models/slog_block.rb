class SlogBlock < ActiveRecord::Base
  attr_accessible :image, :body, :image_cache, :remove_image
  belongs_to :slog
  validates_with ProfanityValidator, fields: [:body]
  mount_uploader :image, ImageUploader
  before_save :default_values
  def default_values
    self.image ||= ''
  end
end
