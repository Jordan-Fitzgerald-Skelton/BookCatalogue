require 'test_helper'

class BooksIntegrationTest < ActionDispatch::IntegrationTest
  # Setup method to create a sample book for testing
  setup do
    @book = books(:one) # Assuming you have a fixture for a book
  end

  # Test the index action
  test "should get index with decorated fields" do
    get books_url, as: :json
    assert_response :success

    # Parse JSON response and check for decorated fields
    json_response = JSON.parse(response.body)
    json_response.each do |book|
      %w[formatted_title formatted_author formatted_description formatted_genre formatted_pages formatted_price formatted_rating].each do |key|
        assert book.key?(key), "Expected JSON response to include #{key}"
      end
    end
  end

  # Test the show action
  test "should show book with decorated fields" do
    get book_url(@book), as: :json
    assert_response :success

    json_response = JSON.parse(response.body)
    %w[formatted_title formatted_author formatted_description formatted_genre formatted_pages formatted_price formatted_rating].each do |key|
      assert json_response.key?(key), "Expected JSON response to include #{key}"
    end
  end

  # Test the create action
  test "should create book" do
    assert_difference("Book.count", 1) do
      post books_url, params: {
        book: {
          title: "New Book",
          author: "New Author",
          description: "A new description",
          genre: "Fiction",
          pages: 250,
          price: 15.99,
          rating: 4
        }
      }, as: :json
    end

    assert_response :created

    # Check for decorated fields in the JSON response
    json_response = JSON.parse(response.body)
    assert_equal "Title: New Book", json_response["formatted_title"]
    assert_equal "Author: New Author", json_response["formatted_author"]
    assert_equal "Description: A new description", json_response["formatted_description"]
  end

  # Test the update action
  test "should update book" do
    patch book_url(@book), params: {
      book: { title: "Updated Title", rating: 5 }
    }, as: :json
    assert_response :success

    # Reload the book and check if it was updated
    @book.reload
    assert_equal "Updated Title", @book.title
    assert_equal 5, @book.rating

    # Check the decorated field in the JSON response
    json_response = JSON.parse(response.body)
    assert_equal "Title: Updated Title", json_response["formatted_title"]
    assert_equal "Rating: 5 / 5", json_response["formatted_rating"]
  end

  # Test the destroy action
  test "should destroy book" do
    assert_difference("Book.count", -1) do
      delete book_url(@book), as: :json
    end
    assert_response :no_content
  end
end