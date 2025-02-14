class Borrowing < ApplicationRecord
  belongs_to :book

  validates :borrower_name, presence: true
  validates :book, presence: true
  validates :borrowed_at, presence: true

  before_validation :set_borrowed_at, on: :create
  after_create :update_book_status
  after_destroy :reset_book_status

  private

  def set_borrowed_at
    self.borrowed_at ||= Time.current
  end

  def update_book_status
    book.update(status: 'borrowed')
  end

  def reset_book_status
    book.update(status: 'available')
  end
end

