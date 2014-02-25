class DaumAlbumsController < AlbumsController
  extend DaumParser

  def index
    # show all daum albums
    @daum_albums = Album.where(content_provider: "D")
  end

  def create
    @daum_albums = DaumParser.get_albums("http://music.daum.net/chart/chartsong/list")

    @daum_albums.each do |daum_album|
      Album.create(title: daum_album["title"], 
                        artist: daum_album["artist"],
                        youtube_hash: daum_album["youtube_hash"],
                        content_provider: "D")
    end

    redirect_to root_path
  end

end
