class Slog < ActiveRecord::Base
  attr_accessible :body, :title, :user_id, :mission_id, :slog_type_id, :featured_image,
  :featured_image_cache, :remove_featured_image, :remote_featured_image_url, :tag_list,
  :slog_blocks_attributes
  acts_as_taggable_on :tags
  acts_as_commentable
  acts_as_votable
  mount_uploader :featured_image, ImageUploader
  belongs_to :user  
  belongs_to :slog_type
  belongs_to :mission
  has_many :slog_blocks
  accepts_nested_attributes_for :slog_blocks
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]
  profanity_filter :body, :title
end
