class Slog < ActiveRecord::Base
  attr_accessible :body, :title, :user_id, :mission_id,
  :tag_list, :slog_blocks_attributes, :slog_type_id
  acts_as_taggable_on :tags
  acts_as_commentable
  acts_as_votable
  belongs_to :user
  belongs_to :mission
  belongs_to :slog_type
  has_many :slog_blocks
  accepts_nested_attributes_for :slog_blocks, allow_destroy: true
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history, :reserved]
  validates :title, presence: { message: "for your slog is required" }
  validates :title, length: { in: 10..110, message: "must be between 10 and 110 characters" } 
  validates_with ProfanityValidator, fields: [:title]
  validates_with SlogBlockValidator
  before_save :make_safe

  private
    def make_safe
      self.title = Sanitize.clean(self.title, Sanitize::Config::RELAXED)
      self.slog_blocks.each do |sb|
        sb.body = Sanitize.clean(sb.body, Sanitize::Config::RELAXED)
      end
    end

end
