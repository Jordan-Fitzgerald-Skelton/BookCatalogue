class BooksIntegrationTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
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
    assert_equal "New Book", json_response["title"]
    assert_equal "New Author", json_response["author"]
    assert_equal "A new description", json_response["description"]
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
    assert_equal "Updated Title", json_response["title"]
    assert_equal 5, json_response["rating"]
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

  test "should return error if search query is missing" do
    get search_books_url, as: :json
    assert_response :unprocessable_entity
    assert_includes @response.body, "Query parameter is missing"
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
