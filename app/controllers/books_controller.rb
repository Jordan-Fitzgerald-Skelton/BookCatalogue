class BooksController < ApplicationController
  before_action :set_decorated_book, only: %i[ show update destroy ]

  # GET /books
  def index
    @books = Book.all.map { |book| BookDecorator.new(book) }
    render json: @books  # AMS will use BookSerializer for each book
  end

  # GET /books/1
  def show
    render json: @book  # AMS uses BookSerializer
  end

  # POST /books
  def create
    @book = Book.new(book_params)

    if @book.save
      render json: @book, status: :created, location: @book  # AMS uses BookSerializer
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      render json: @book  # AMS uses BookSerializer
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy!
  end

  private

    # Decorate @book instance with BookDecorator
    def set_decorated_book
      @book = BookDecorator.new(Book.find(params[:id]))
    end

    # Only allow a list of trusted parameters through
    def book_params
      params.require(:book).permit(:title, :author, :description, :genre, :pages, :rating, :price)
    end
end
