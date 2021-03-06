module MelonParser
  extend Parser

  extend Crawler
  extend YoutubeHashParser

  def self.get_albums(url) #using class method
    @albums = Array.new(50){ Hash.new }

    # PROCESS 1 : Crawl from Naver
    # PROCESS 2 : Parse 
    get_albums_from_content_provider(@albums, crawl_from(url).css("tbody tr"))

    # PROCESS 3 : Search and Crawl from Youtube
    # PROCESS 4 : Parse
    YoutubeHashParser.get_albums_from_youtube(@albums)
  end


  # Implementation of Template
  def self.get_albums_from_content_provider(albums, source)
    albums.each_with_index do |album, index|
      album["title"] = parse_title source[index]
      album["artist"] = parse_artist source[index]
    end
  end

  def self.parse_title(source)
    source.css(".lineLine1 a")[1]["title"]
  end

  def self.parse_artist(source)
    source.css(".lineLine2 a")[0]["title"]
  end
end
