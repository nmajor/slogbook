class Slog < ActiveRecord::Base
  attr_accessible :body, :title, :user_id, :mission_id,
  :tag_list, :slog_blocks_attributes
  acts_as_taggable_on :tags
  acts_as_commentable
  acts_as_votable
  belongs_to :user
  belongs_to :mission
  has_many :slog_blocks
  accepts_nested_attributes_for :slog_blocks, allow_destroy: true
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history, :reserved]
  validates :title, presence: { message: "for your slog is required" }
  validates :title, length: { in: 10..55, message: "must be between 10 and 55 characters" } 
  validates_with ProfanityValidator, fields: [:title]
  validates_with SlogBlockValidator
end
