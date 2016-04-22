require './library.rb'

lib = Library.new
=begin lib.add_book(Book.new("Potter","Rowling"))
lib.add_order(Order.new("Potter","Den","21.04.16"))
lib.add_reader(Reader.new("Petya","pet123@gmail.com","Dnepropetrovsk","Moljera","10"))
lib.add_author(Author.new("Rowling","writer"))

lib.save_lib
=end
lib.load_orders
lib.stat_reader("Kobzar")
puts lib.most_popular_book