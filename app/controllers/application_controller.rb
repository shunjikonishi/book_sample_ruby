class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
  end

  def books
    books = Book.ordered
    render :locals => {:books => books}
  end

  def shops
    shops = Bookstore.all
    render :locals => {:shops => shops}
  end

  def shopDetail
    id = params[:id]
    shop = Bookstore.find(id)
    books = Book.belongsToShop(id)
    render :locals => {:shop => shop, :books => books}
  end

  def booksWithQuantity
    books = Book.withQuantity
    render :locals => {:books => books}
  end
end
