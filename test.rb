require './library.rb'

lib = Library.new
lib.load_authors
lib.load_books
lib.load_readers
lib.load_orders
puts lib.authors.inspect+"\n\n"
puts lib.books.inspect+"\n\n"
puts lib.readers.inspect+"\n\n"
puts lib.orders.inspect+"\n\n"