class Book < ActiveRecord::Base
  belongs_to :author
  has_many :bookstore_books

  scope :ordered, -> { includes(:author).order("authors.name, books.id")}

  scope :belongsToShop, lambda { |bookstore_id|
    select("books.*, count(*) as quantity").
      includes(:author).
      joins(:bookstore_books).
      where("bookstore_books.bookstore_id = ?", bookstore_id).
      group("books.id").
      order("books.name")
  }

  scope :withQuantity, -> {
    select("books.*, count(bookstore_books.book_id) as quantity").
      joins("LEFT OUTER JOIN bookstore_books ON (books.id = bookstore_books.book_id)").
      group("books.id").
      order("quantity desc, books.id")
  }
end
