class AlbumsController < ApplicationController

  def index
    # show all albums
    @albums = Album.all
  end

  def create
    album = YoutubeHashParser.get_album_from_youtube params[:custom_album_query]
    data = { youtube_hash: album["youtube_hash"] }
    render json: album.to_json
  end
end
