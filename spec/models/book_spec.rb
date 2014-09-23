require 'rails_helper'

RSpec.describe Book, :type => :model do
  before:all do
    @id_of_shinjuku_nishiguchi = Bookstore.where("name = ?", "Shinjuku Nishiguchi").first.id
    expect(@id_of_shinjuku_nishiguchi).to be > 0
  end

  describe "ordered method" do
    it "The number of records must be 6" do
      books = Book.ordered
      expect(books.length).to eq(6)
    end
    it "ordered by author name" do
      books = Book.ordered
      books.inject { |acc, item|
        expect(item.author.name).to be >= acc.author.name
        item
      }
    end
  end

  describe "belongsToShop method" do 
    it "The number of records must be 4" do
      books = Book.belongsToShop(@id_of_shinjuku_nishiguchi)
      expect(books.length).to eq(4)
    end
    it "There are 3 books which title is 'The Mist'" do
      books = Book.belongsToShop(@id_of_shinjuku_nishiguchi).where("books.name = ?", "The Mist")
      expect(books.length).to eq(1)
      expect(books.first.quantity).to eq(3)
    end
  end

  describe "withQuantity method" do
    it "The number of records must be 6" do
      books = Book.withQuantity
      expect(books.length).to eq(6)
    end
    it "Correct quantity" do
      books = Book.withQuantity
      mist = books.where("books.name = ?", "The Mist")
      noStock = books.having("quantity = ?", 0) 
      expect(mist.length).to eq(1)
      expect(mist.first.quantity).to eq(5)

      expect(noStock.length).to eq(1)
      expect(noStock.first.name).to eq("Programming Ruby")
    end
    it "ordered by quantity desc" do
      books = Book.withQuantity
      books.inject { |acc, item|
        expect(item.quantity).to be <= acc.quantity
        item
      }
    end
  end
end
