class BooksController < ApplicationController
  before_action :set_book, only: [ :show, :edit, :update, :destroy, :borrow, :return ]

  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.status = "available"

    if @book.save
      redirect_to @book, notice: "Book was successfully created."
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end


  def update
    if @book.update(book_params)
      redirect_to @book, notice: "Book was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_url, notice: "Book was successfully deleted."
  end

  def borrow
    if @book.available?
      borrowing = @book.borrowings.build(
        borrower_name: params[:borrower_name],
        borrowed_at: Time.current
      )

      if borrowing.save
        @book.update(status: "borrowed")
        redirect_to @book, notice: "Book was successfully borrowed."
      else
        redirect_to @book, alert: "Error borrowing book."
      end
    else
      redirect_to @book, alert: "Book is not available."
    end
  end

  def return
    if borrowing = @book.current_borrowing
      borrowing.update(returned_at: Time.current)
      @book.update(status: "available")
      redirect_to @book, notice: "Book was successfully returned."
    else
      redirect_to @book, alert: "Book was not borrowed."
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end



  def book_params
    params.require(:book).permit(:title, :author, :isbn)
  end
end
