require "delegate"
# Decorator design pattern
# Sets the format for each parameter
class BookDecorator < SimpleDelegator
  def formatted_title
    "Title: #{title}"
  end

  def formatted_author
    "Author: #{author}"
  end

  def formatted_description
    "Description: #{description}"
  end

  def formatted_genre
    "Genre: #{genre}"
  end

  def formatted_pages
    "Pages: #{pages}"
  end

  def formatted_price
    "Pages: #{price}"
  end

  def formatted_rating
    "Rating: #{rating} / 5"
  end
end
