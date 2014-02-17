class CreateNaverAlbums < ActiveRecord::Migration
  def change
    create_table :naver_albums do |t|
      t.string :content_provider, default: "N" # "N" stands for "Naver Music"

      t.string :title
      t.string :artist

      t.string :youtube_hash # Hash for Youtube.com watch / embed / thumbnail

      t.timestamps
    end
  end
end
