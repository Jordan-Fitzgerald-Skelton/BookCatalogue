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

  test "should not update book no title" do
    patch book_url(@book), params: { book: { author: @book.author, description: @book.description, genre: @book.genre, pages: @book.pages, price: @book.price, rating: @book.rating, title: "" } }, as: :json
    assert_not (200...299).include?(response.code.to_i)
  end

  test "should not update book no author" do
    patch book_url(@book), params: { book: { author: "", description: @book.description, genre: @book.genre, pages: @book.pages, price: @book.price, rating: @book.rating, title: @book.title } }, as: :json
    assert_not (200...299).include?(response.code.to_i)
  end

  test "should not update book no description" do
    patch book_url(@book), params: { book: { author: @book.author, description: "", genre: @book.genre, pages: @book.pages, price: @book.price, rating: @book.rating, title: @book.title } }, as: :json
    assert_not (200...299).include?(response.code.to_i)
  end

  test "should not update book no genre" do
    patch book_url(@book), params: { book: { author: @book.author, description: @book.description, genre: "", pages: @book.pages, price: @book.price, rating: @book.rating, title: @book.title } }, as: :json
    assert_not (200...299).include?(response.code.to_i)
  end

  test "should not update book no pages" do
    patch book_url(@book), params: { book: { author: @book.author, description: @book.description, genre: @book.genre, pages: "", price: @book.price, rating: @book.rating, title: @book.title } }, as: :json
    assert_not (200...299).include?(response.code.to_i)
  end

  test "should not update book no price" do
    patch book_url(@book), params: { book: { author: @book.author, description: @book.description, genre: @book.genre, pages: @book.pages, price: "", rating: @book.rating, title: @book.title } }, as: :json
    assert_not (200...299).include?(response.code.to_i)
  end

  test "should not update book no rating" do
    patch book_url(@book), params: { book: { author: @book.author, description: @book.description, genre: @book.genre, pages: @book.pages, price: @book.price, rating: "", title: @book.title } }, as: :json
    assert_not (200...299).include?(response.code.to_i)
  end
end
