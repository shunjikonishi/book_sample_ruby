# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Bookstore.delete_all
bookstores = Bookstore.create([
	{ name: 'Shinjuku Nishiguchi'},
	{ name: 'Ikebukuro'},
	{ name: 'Tokyo Yaesu'}
])

Author.delete_all
authors = Author.create([
	{ name: 'Stephen King'},
	{ name: 'Neale Donald Walsch'},
	{ name: 'Dave Thomas'}
])

Book.delete_all
books = Book.create([
	{ name: 'The Mist', author_id: authors[0].id},
	{ name: 'Dream Catcher', author_id: authors[0].id},
	{ name: 'The Green Mile', author_id: authors[0].id},
	{ name: 'Conversation With God', author_id: authors[1].id},
	{ name: 'Home with God', author_id: authors[1].id},
	{ name: 'Programming Ruby', author_id: authors[2].id}
])

BookstoreBook.delete_all
boostore_books = BookstoreBook.create([
	{ bookstore_id: bookstores[0].id, book_id: books[3].id},
	{ bookstore_id: bookstores[0].id, book_id: books[3].id},
	{ bookstore_id: bookstores[0].id, book_id: books[4].id},
	{ bookstore_id: bookstores[0].id, book_id: books[1].id},
	{ bookstore_id: bookstores[0].id, book_id: books[0].id},
	{ bookstore_id: bookstores[0].id, book_id: books[0].id},
	{ bookstore_id: bookstores[0].id, book_id: books[0].id},
	{ bookstore_id: bookstores[1].id, book_id: books[3].id},
	{ bookstore_id: bookstores[1].id, book_id: books[0].id},
	{ bookstore_id: bookstores[1].id, book_id: books[0].id},
	{ bookstore_id: bookstores[2].id, book_id: books[1].id},
	{ bookstore_id: bookstores[2].id, book_id: books[2].id}
])
