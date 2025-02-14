class Book < ApplicationRecord
  has_many :borrowings
  has_one :current_borrowing, -> { order(created_at: :desc) }, class_name: 'Borrowing'

  validates :title, presence: true
  validates :author, presence: true
  validates :isbn, presence: true, uniqueness: true
  validates :status, presence: true, inclusion: { in: ['available', 'borrowed'] }

  before_validation :set_default_status, on: :create

  def available?
    status == 'available'
  end

  def borrowed?
    status == 'borrowed'
  end

  def current_borrowing
    borrowings.where(returned_at: nil).first
  end
  
  def current_borrower
    current_borrowing&.borrower_name
  end

  private

  def set_default_status
    self.status ||= 'available'
  end
end