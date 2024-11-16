require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
  end

  test "should get index" do
    get books_url, as: :json
    assert_response :success
  end

  test "should create book" do
    assert_difference("Book.count") do
      post books_url, params: { book: { author: @book.author, description: @book.description, genre: @book.genre, pages: @book.pages, price: @book.price, rating: @book.rating, title: @book.title } }, as: :json
    end
    assert_response :created
  end

  test "should show book" do
    get book_url(@book), as: :json
    assert_response :success
  end

  test "should update book" do
    patch book_url(@book), params: { book: { author: @book.author, description: @book.description, genre: @book.genre, pages: @book.pages, price: @book.price, rating: @book.rating, title: @book.title } }, as: :json
    assert_response :success
  end

  test "should destroy book" do
    assert_difference("Book.count", -1) do
      delete book_url(@book), as: :json
    end
    assert_response :no_content
  end

  # Test updates with missing fields
  test "should not update book no title" do
    patch book_url(@book), params: { book: { title: "" } }, as: :json
    assert_response :unprocessable_entity
  end

  test "should not update book no author" do
    patch book_url(@book), params: { book: { author: "" } }, as: :json
    assert_response :unprocessable_entity
  end

  test "should not update book no description" do
    patch book_url(@book), params: { book: { description: "" } }, as: :json
    assert_response :unprocessable_entity
  end

  test "should not update book no genre" do
    patch book_url(@book), params: { book: { genre: "" } }, as: :json
    assert_response :unprocessable_entity
  end

  test "should not update book no pages" do
    patch book_url(@book), params: { book: { pages: "" } }, as: :json
    assert_response :unprocessable_entity
  end

  test "should not update book no price" do
    patch book_url(@book), params: { book: { price: "" } }, as: :json
    assert_response :unprocessable_entity
  end

  test "should not update book no rating" do
    patch book_url(@book), params: { book: { rating: "" } }, as: :json
    assert_response :unprocessable_entity
  end

  test "should not update book without title" do
    patch book_url(@book), params: { book: { title: nil } }, as: :json
    assert_not @book.reload.title.nil?, "Book was updated despite missing title"
  end

  # Test creating a book without required fields
  test "should not create book without title" do
    assert_no_difference("Book.count") do
      post books_url, params: { book: { author: @book.author, description: @book.description, genre: @book.genre, pages: @book.pages, price: @book.price, rating: @book.rating } }, as: :json
    end
    assert_response :unprocessable_entity
  end

  test "should not create book without author" do
    assert_no_difference("Book.count") do
      post books_url, params: { book: { title: @book.title, description: @book.description, genre: @book.genre, pages: @book.pages, price: @book.price, rating: @book.rating } }, as: :json
    end
    assert_response :unprocessable_entity
  end

  # Test updating book with invalid pages (negative value)
  test "should not update book with invalid pages" do
    patch book_url(@book), params: { book: { pages: -1 } }, as: :json
    assert_not @book.reload.pages == -1
    assert_response :unprocessable_entity
  end

  # Test updating book with invalid price (non-numeric value)
  test "should not update book with invalid price" do
    patch book_url(@book), params: { book: { price: "invalid" } }, as: :json
    assert_not @book.reload.price == "invalid"
    assert_response :unprocessable_entity
  end

  test "should search books with valid query" do
    query = "Harry Potter"
    VCR.use_cassette("google_books_search_harry_potter") do
      get search_books_url, params: { q: query }, as: :json
      assert_response :success
      items = JSON.parse(response.body)["items"]
      assert_not_nil items # Ensure items key exists
      assert_not_empty items # Ensure results are present
    end
  end  

  # Test the search action when no query is provided
  test "should return error if search query is missing" do
    get search_books_url, as: :json
    assert_response :unprocessable_entity
    assert_includes @response.body, "Query parameter is missing"
  end

  test "should return error if google api call fails" do
    VCR.use_cassette("google_books_search_error") do
      get search_books_url, params: { q: "InvalidQuery" }, as: :json
      assert_response :bad_request
      response_body = JSON.parse(response.body)
      assert_equal "Unable to fetch books from Google API", response_body["error"]
    end
  end    

  test "should return 404 for non-existing book" do
    nonexistent_id = "nonexistent_id"
    get book_url(id: nonexistent_id), as: :json
    assert_response :not_found  # Expect a 404 response
  end
end
