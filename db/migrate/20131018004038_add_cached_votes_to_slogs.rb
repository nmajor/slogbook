class AddCachedVotesToSlogs < ActiveRecord::Migration
  def self.up
    add_column :slogs, :cached_votes_total, :integer, :default => 0
    add_column :slogs, :cached_votes_score, :integer, :default => 0
    add_column :slogs, :cached_votes_up, :integer, :default => 0
    add_column :slogs, :cached_votes_down, :integer, :default => 0
    add_index  :slogs, :cached_votes_total
    add_index  :slogs, :cached_votes_score
    add_index  :slogs, :cached_votes_up
    add_index  :slogs, :cached_votes_down

    # Uncomment this line to force caching of existing votes
    Slog.find_each(&:update_cached_votes)
  end

  def self.down
    remove_column :slogs, :cached_votes_total
    remove_column :slogs, :cached_votes_score
    remove_column :slogs, :cached_votes_up
    remove_column :slogs, :cached_votes_down
  end
end
