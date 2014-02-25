class MelonAlbumsController < AlbumsController
  extend MelonParser

  def index
    # show all melon albums
    @melon_albums = Album.where(content_provider: "M")
  end

  def create
    @melon_albums = MelonParser.get_albums("http://www.melon.com/cds/chart/web/chartrealtime_list.htm")

    @melon_albums.each do |melon_album|
      Album.create(title: melon_album["title"],
                        artist: melon_album["artist"],
                        youtube_hash: melon_album["youtube_hash"],
                        content_provider: "M")
    end

    redirect_to root_path
  end
end
