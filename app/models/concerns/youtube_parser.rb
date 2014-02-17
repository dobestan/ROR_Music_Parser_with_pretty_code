module YoutubeParser
  extend ActiveSupport::Concern

  def get_albums_from_youtube(albums)
    # albums(list of hashes) -> albums(list of hashes)
    # type check
    #   - albums : List of Hash
    #   - album : Hash ( responds to title, artist, content_provider, youtube_hash )
    albums.each do |album|
      search_url = get_youtube_search_url(album["title"], album["artist"])

      album["youtube_hash"] = crawl_from(search_url).css('.result-list .yt-lockup')[0].css('.yt-lockup-thumbnail a')[0]["href"][9..-1]
    end
  end
end
