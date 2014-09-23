* Book sample Ruby

** Database
rails generate model bookstore name:string
rails generate model author name:string
rails generate model book name:string author_id:integer
rails generate model bookstore_book bookstore_id:integer book_id:integer

== README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
