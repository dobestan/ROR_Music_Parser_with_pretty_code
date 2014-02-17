class NaverAlbumsController < AlbumsController
  # inherit from AlbumsController
  
  def index
    # show all naver albums
  end

  def show
    # show one album
    # NOT necessary : using "albums#show"
  end

  def new
    # get new data from Naver Music
  end

  def create
    # create a album
    # NOT necessary : using "albums#create"
  end
end
