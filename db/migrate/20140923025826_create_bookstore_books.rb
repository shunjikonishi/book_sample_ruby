class CreateBookstoreBooks < ActiveRecord::Migration
  def change
    create_table :bookstore_books do |t|
      t.integer :bookstore_id
      t.integer :book_id

      t.timestamps
    end
  end
end
