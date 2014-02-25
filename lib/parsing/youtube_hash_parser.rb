module YoutubeHashParser
  extend UrlGenerator
  extend Crawler

  def self.get_albums_from_youtube(albums)
    albums.each do |album|
      search_url = get_youtube_search_url(album["title"], album["artist"])
      album["youtube_hash"] = get_first_result_from_youtube search_url
    end
  end

  def self.get_album_from_youtube(custom_album_query)
    album = Hash.new
    search_url = get_youtube_search_url custom_album_query
    album["youtube_hash"] = get_first_result_from_youtube search_url
    return album
  end

  def self.get_first_result_from_youtube(search_url)
    crawl_from(search_url).css('.result-list .yt-lockup')[0].css('.yt-lockup-thumbnail a')[0]["href"][9..-1] 
  end
end
