class BookstoreBook < ActiveRecord::Base
  belongs_to :bookstore
  belongs_to :book
end
