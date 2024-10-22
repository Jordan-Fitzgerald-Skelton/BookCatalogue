# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb
Book.create!([
  { title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', description: 'A novel set in the Jazz Age', genre: 'Fiction', pages: 180, rating: 5, price: 10 },
  { title: 'To Kill a Mockingbird', author: 'Harper Lee', description: 'A novel about racial injustice', genre: 'Fiction', pages: 324, rating: 5, price: 12 },
  { title: '1984', author: 'George Orwell', description: 'A dystopian novel about totalitarianism', genre: 'Dystopian', pages: 328, rating: 5, price: 15 },
  { title: 'The Catcher in the Rye', author: 'J.D. Salinger', description: 'A story of teenage rebellion', genre: 'Fiction', pages: 277, rating: 4, price: 10 },
  { title: 'The Hobbit', author: 'J.R.R. Tolkien', description: 'A fantasy novel about Bilbo Baggins', genre: 'Fantasy', pages: 310, rating: 5, price: 18 },
  { title: 'Pride and Prejudice', author: 'Jane Austen', description: 'A classic romantic novel', genre: 'Romance', pages: 279, rating: 5, price: 14 },
  { title: 'Moby-Dick', author: 'Herman Melville', description: 'A tale of obsession and revenge', genre: 'Adventure', pages: 635, rating: 4, price: 16 },
  { title: 'The Shining', author: 'Stephen King', description: 'A horror novel about a haunted hotel', genre: 'Horror', pages: 447, rating: 4, price: 17 },
  { title: 'The Da Vinci Code', author: 'Dan Brown', description: 'A mystery thriller involving secret societies', genre: 'Thriller', pages: 489, rating: 4, price: 20 },
  { title: 'Harry Potter and the Sorcerer\'s Stone', author: 'J.K. Rowling', description: 'A young boy discovers he\'s a wizard', genre: 'Fantasy', pages: 309, rating: 5, price: 12 },
  { title: 'Brave New World', author: 'Aldous Huxley', description: 'A dystopian novel about a future world state', genre: 'Dystopian', pages: 268, rating: 4, price: 15 },
  { title: 'The Road', author: 'Cormac McCarthy', description: 'A post-apocalyptic tale of survival', genre: 'Dystopian', pages: 287, rating: 4, price: 13 },
  { title: 'Gone Girl', author: 'Gillian Flynn', description: 'A psychological thriller about a missing woman', genre: 'Thriller', pages: 422, rating: 4, price: 18 },
  { title: 'The Girl on the Train', author: 'Paula Hawkins', description: 'A psychological thriller about a commuter\'s obsession', genre: 'Mystery', pages: 395, rating: 4, price: 17 },
  { title: 'The Alchemist', author: 'Paulo Coelho', description: 'A philosophical novel about a shepherd\'s journey', genre: 'Fiction', pages: 208, rating: 4, price: 10 },
  { title: 'The Fault in Our Stars', author: 'John Green', description: 'A young adult romance about two cancer patients', genre: 'Romance', pages: 313, rating: 4, price: 11 },
  { title: 'The Hunger Games', author: 'Suzanne Collins', description: 'A dystopian novel about survival games', genre: 'Dystopian', pages: 374, rating: 5, price: 12 },
  { title: 'The Maze Runner', author: 'James Dashner', description: 'A young adult dystopian novel about escaping a maze', genre: 'Sci-Fi', pages: 375, rating: 4, price: 12 },
  { title: 'Dune', author: 'Frank Herbert', description: 'A science fiction novel about desert planets and political intrigue', genre: 'Sci-Fi', pages: 412, rating: 5, price: 18 },
  { title: 'Ender\'s Game', author: 'Orson Scott Card', description: 'A young boy is trained to defend Earth from alien invasions', genre: 'Sci-Fi', pages: 324, rating: 5, price: 14 },
  { title: 'It', author: 'Stephen King', description: 'A horror novel about a group of kids facing an evil entity', genre: 'Horror', pages: 1138, rating: 5, price: 22 },
  { title: 'Dracula', author: 'Bram Stoker', description: 'A gothic horror novel about the legendary vampire', genre: 'Horror', pages: 418, rating: 4, price: 10 },
  { title: 'Frankenstein', author: 'Mary Shelley', description: 'A story of a scientist who creates life, with disastrous results', genre: 'Horror', pages: 280, rating: 4, price: 9 },
  { title: 'The Exorcist', author: 'William Peter Blatty', description: 'A tale of demonic possession and exorcism', genre: 'Horror', pages: 340, rating: 4, price: 16 },
  { title: 'Crime and Punishment', author: 'Fyodor Dostoevsky', description: 'A philosophical novel about guilt and redemption', genre: 'Philosophy', pages: 430, rating: 5, price: 14 },
  { title: 'Meditations', author: 'Marcus Aurelius', description: 'A collection of personal writings by the Roman Emperor', genre: 'Philosophy', pages: 254, rating: 5, price: 8 },
  { title: 'The Art of War', author: 'Sun Tzu', description: 'An ancient treatise on military strategy', genre: 'Philosophy', pages: 112, rating: 5, price: 10 },
  { title: 'Thinking, Fast and Slow', author: 'Daniel Kahneman', description: 'A book on behavioral psychology and decision making', genre: 'Non-fiction', pages: 499, rating: 5, price: 18 },
  { title: 'Sapiens: A Brief History of Humankind', author: 'Yuval Noah Harari', description: 'A historical exploration of human evolution', genre: 'Non-fiction', pages: 443, rating: 5, price: 20 },
  { title: 'The Power of Habit', author: 'Charles Duhigg', description: 'A book on the science of habit formation and productivity', genre: 'Self-help', pages: 371, rating: 4, price: 16 },
  { title: 'The Lean Startup', author: 'Eric Ries', description: 'A guide to building successful startups using lean principles', genre: 'Business', pages: 336, rating: 5, price: 18 },
  { title: 'Good to Great', author: 'Jim Collins', description: 'A study of how companies transform from good to great', genre: 'Business', pages: 320, rating: 5, price: 16 },
  { title: 'Steve Jobs', author: 'Walter Isaacson', description: 'A biography of Steve Jobs', genre: 'Biography', pages: 656, rating: 5, price: 22 },
  { title: 'Becoming', author: 'Michelle Obama', description: 'A memoir by the former First Lady of the United States', genre: 'Biography', pages: 448, rating: 5, price: 20 },
  { title: 'Educated', author: 'Tara Westover', description: 'A memoir about a woman who grows up in a survivalist family', genre: 'Biography', pages: 334, rating: 5, price: 15 },
  { title: 'Atomic Habits', author: 'James Clear', description: 'A guide on how to build good habits and break bad ones', genre: 'Self-help', pages: 320, rating: 5, price: 16 },
  { title: 'Man\'s Search for Meaning', author: 'Viktor E. Frankl', description: 'A Holocaust survivor\'s memoir and psychological exploration', genre: 'Philosophy', pages: 200, rating: 5, price: 12 },
  { title: 'Quiet: The Power of Introverts', author: 'Susan Cain', description: 'A book about the power of introversion', genre: 'Self-help', pages: 352, rating: 4, price: 14 },
  { title: 'The Subtle Art of Not Giving a F*ck', author: 'Mark Manson', description: 'A counterintuitive approach to living a good life', genre: 'Self-help', pages: 224, rating: 4, price: 15 },
  { title: 'The Silent Patient', author: 'Alex Michaelides', description: 'A psychological thriller about a woman who stops speaking after a murder', genre: 'Thriller', pages: 336, rating: 4, price: 14 }
])
