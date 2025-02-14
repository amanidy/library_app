# README

# Library Management System

A simple Ruby on Rails application for managing a book lending library. This application allows users to manage books and track their lending history without requiring authentication.

## Features

- Book management (CRUD operations)
- Borrowing and returning books
- Tracking borrowing history
- Viewing borrower history
- Basic data validation

## Requirements

- Ruby 3.2.0 or higher
- Rails 8.0
- SQLite3

## Setup

1. Clone the repository:
```bash
git clone [repository-url]
cd library_app
```

2. Install dependencies:
```bash
bundle install
```

3. Set up the database:
```bash
rails db:create
rails db:migrate
```

4. Start the server:
```bash
rails server
```

5. Visit `http://localhost:3000` in your browser

## Running Tests

To run the test suite:
```bash
rails test
```

## Usage

- Visit the home page to see all books
- Click "Add New Book" to create a new book
- Click "View" on any book to see its details and borrowing history
- Use the borrow form on a book's page to borrow it
- Use the return button to return a borrowed book
- Click on a borrower's name to see their borrowing history

## Data Validation

- Books require a title, author, and unique ISBN
- Borrowings require a borrower name
- Return dates must be after borrow dates
- Books can't be borrowed if already borrowed

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request