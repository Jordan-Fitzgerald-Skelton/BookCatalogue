require "delegate"
# Decorator design pattern for formatted attributes
class BookDecorator < SimpleDelegator
  def formatted_title
    "#{title}"
  end

  def formatted_author
    "#{author}"
  end

  def formatted_description
    "#{description}"
  end

  def formatted_genre
    "#{genre}"
  end

  def formatted_pages
    "#{pages}"
  end

  def formatted_price
    "€#{price}"
  end

  def formatted_rating
    "#{rating} / 5"
  end
end
