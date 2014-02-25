class NaverAlbumsController < AlbumsController
  extend NaverParser

  def index
    # show all naver albums
    @naver_albums = Album.where(content_provider: "N")
  end

  def create
    @naver_albums = NaverParser.get_albums("http://music.naver.com/todayMusic/index.nhn?startDate=20140210")

    @naver_albums.each do |naver_album|
      Album.create( title: naver_album["title"],
                    artist: naver_album["artist"],
                    youtube_hash: naver_album["youtube_hash"],
                    content_provider: "N" )
    end

    redirect_to root_path
  end
end
