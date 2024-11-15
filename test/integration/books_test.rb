class BooksIntegrationTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one) # Assuming you have a fixture for a book
  end

  test "should get index with decorated fields" do
    get books_url, as: :json
    assert_response :success

    json_response = JSON.parse(response.body)
    json_response.each do |book|
      assert_decorated_fields_in_response(book)
    end
  end

  test "should show book with decorated fields" do
    get book_url(@book), as: :json
    assert_response :success

    json_response = JSON.parse(response.body)
    assert_decorated_fields_in_response(json_response)
  end

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

    json_response = JSON.parse(response.body)
    assert_equal "Title: New Book", json_response["formatted_title"]
    assert_equal "Author: New Author", json_response["formatted_author"]
    assert_equal "Description: A new description", json_response["formatted_description"]
  end

  test "should update book" do
    patch book_url(@book), params: {
      book: { title: "Updated Title", rating: 5 }
    }, as: :json
    assert_response :success

    @book.reload
    assert_equal "Updated Title", @book.title
    assert_equal 5, @book.rating

    json_response = JSON.parse(response.body)
    assert_equal "Title: Updated Title", json_response["formatted_title"]
    assert_equal "Rating: 5 / 5", json_response["formatted_rating"]
  end

  test "should destroy book" do
    assert_difference("Book.count", -1) do
      delete book_url(@book), as: :json
    end
    assert_response :no_content
  end

  test "should not create book without title" do
    assert_no_difference("Book.count") do
      post books_url, params: {
        book: {
          author: "New Author",
          description: "A new description",
          genre: "Fiction",
          pages: 250,
          price: 15.99,
          rating: 4
        }
      }, as: :json
    end
    assert_response :unprocessable_entity
  end

  test "should not create book with negative pages" do
    assert_no_difference("Book.count") do
      post books_url, params: {
        book: {
          title: "Invalid Book",
          author: "Invalid Author",
          description: "Invalid description",
          genre: "Non-Fiction",
          pages: -5,
          price: 10.99,
          rating: 3
        }
      }, as: :json
    end
    assert_response :unprocessable_entity

    json_response = JSON.parse(response.body)
    assert_includes json_response["pages"], "must be greater than or equal to 0"
  end

  test "should search books with valid query" do
    query = "Harry Potter"
    VCR.use_cassette("google_books_search_harry_potter") do
      get search_books_url, params: { q: query }, as: :json
      assert_response :success
    end
  end

  test "should return error if search query is missing" do
    get search_books_url, as: :json
    assert_response :unprocessable_entity
    assert_includes @response.body, "Query parameter is missing"
  end

  test "should return error if google api call fails" do
    VCR.use_cassette("google_books_search_error") do
      get search_books_url, params: { q: "Invalid Query" }, as: :json
      assert_response :bad_request
      assert_includes @response.body, "Unable to fetch books from Google API"
    end
  end

  test "should return 404 for non-existing book" do
    get book_url(id: "nonexistent_id"), as: :json
    assert_response :not_found
  end

  test "should return 404 for update on non-existing book" do
    patch book_url(id: "nonexistent_id"), params: { book: { title: "Updated Title" } }, as: :json
    assert_response :not_found
  end

  test "should return 404 for destroy on non-existing book" do
    delete book_url(id: "nonexistent_id"), as: :json
    assert_response :not_found
  end
end