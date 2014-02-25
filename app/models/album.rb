class Album < ActiveRecord::Base
  # Validation
  #   - all colums must be present
  #   - youtube hash must be unique
  #   - [title, artist] pair must be unique

  validates :title, presence: true
  validates :artist, presence: true
  validates :content_provider, presence: true

  validates :youtube_hash, presence: true,
                            uniqueness: true
  validates_uniqueness_of :title, scope: [:artist]
end
