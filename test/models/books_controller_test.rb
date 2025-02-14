require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get books_url
    assert_response :success
  end

  test "should create book" do
    assert_difference("Book.count") do
      post books_url, params: {
        book: {
          title: "New Book",
          author: "Author Name",
          isbn: "1234567890"
        }
      }
    end

    assert_redirected_to book_url(Book.last)
    assert_equal "available", Book.last.status
  end

  test "should borrow book" do
    book = Book.create!(
      title: "Test Book",
      author: "Test Author",
      isbn: "1234567890",
      status: "available"
    )

    post borrow_book_url(book), params: { borrower_name: "John Doe" }

    assert_redirected_to book_url(book)
    book.reload
    assert_equal "borrowed", book.status
    assert_equal "John Doe", book.current_borrowing.borrower_name
  end
end
