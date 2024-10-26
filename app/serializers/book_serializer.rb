# Specifies which attributes of the Book model will be included in the JSON response
# Also includes a decorator design pattern for formatted attributes
class BookSerializer < ActiveModel::Serializer
  attributes :formatted_title, :formatted_author, :formatted_description, :formatted_genre, :formatted_pages, :formatted_price, :formatted_rating

  def formatted_title
    BookDecorator.new(object).formatted_title
  end

  def formatted_author
    BookDecorator.new(object).formatted_author
  end

  def formatted_description
    BookDecorator.new(object).formatted_description
  end

  def formatted_genre
    BookDecorator.new(object).formatted_genre
  end

  def formatted_pages
    BookDecorator.new(object).formatted_pages
  end

  def formatted_price
    BookDecorator.new(object).formatted_price
  end

  def formatted_rating
    BookDecorator.new(object).formatted_rating
  end
end
