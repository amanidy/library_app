require "test_helper"

class BookTest < ActiveSupport::TestCase
  test "should not save book without title" do
    book = Book.new(author: "John Doe", isbn: "1234567890")
    assert_not book.save, "Saved the book without a title"
  end

  test "should not save book with duplicate ISBN" do
    Book.create!(
      title: "First Book",
      author: "John Doe",
      isbn: "1234567890",
      status: "available"
    )
    
    book = Book.new(
      title: "Second Book",
      author: "Jane Smith",
      isbn: "1234567890",
      status: "available"
    )
    
    assert_not book.save, "Saved the book with duplicate ISBN"
  end
end