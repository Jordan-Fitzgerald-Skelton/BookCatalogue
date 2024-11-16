class BooksController < ApplicationController
  before_action :set_book, only: %i[show update destroy]

  # GET /books
  def index
    @books = Book.all
    render json: @books
  end

  # GET /books/1
  def show
    render json: @book
  end

  # POST /books
  def create
    @book = Book.new(book_params)

    if @book.save
      render json: @book, status: :created, location: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    logger.debug "Received params: #{params.inspect}"
    if @book.update(book_params)
      render json: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy!
    head :no_content
  end

  # GET /books/search
  def search
    query = params[:q]
    if query.present?
      response = HTTP.get("https://www.googleapis.com/books/v1/volumes", params: { q: query, key: Rails.application.credentials.google_books_api_key })
      if response.status.success?
        render json: response.parse
      else
        render json: { error: "Unable to fetch books from Google API" }, status: :bad_request
      end
    else
      render json: { error: "Query parameter is missing" }, status: :unprocessable_entity
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :description, :genre, :pages, :rating, :price)
  end
end
