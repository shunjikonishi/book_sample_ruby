class Bookstore < ActiveRecord::Base
  has_many :bookstore_books
  has_many :books, through: :bookstore_books

end
