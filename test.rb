require './library.rb'

lib = Library.new
=begin lib.add_book(Book.new("Potter","Rowling"))
lib.add_order(Order.new("Potter","Den","21.04.16"))
lib.add_reader(Reader.new("Petya","pet123@gmail.com","Dnepropetrovsk","Moljera","10"))
lib.add_author(Author.new("Rowling","writer"))
lib.add_author(Author.new("Arthur Ignatius Conan Doyle","writer"))
lib.add_reader(Reader.new("Vasya","vas123@gmail.com","Dnepropetrovsk","Mostovaya","20"))
lib.add_book(Book.new("The Lost World","Arthur Ignatius Conan Doyle"))
lib.add_order(Order.new("RubyTutorial","Vasya","23.04.16"))
lib.add_reader(Reader.new("Ivanov Ivan","iv124@gmail.com","Dnepropetrovsk","Red ctreet","88"))
lib.add_order(Order.new("Lord of The Rings","Ivanov Ivan","23.04.16"))
lib.save_lib
=end
lib.load_orders
lib.stat_reader("Kobzar")
lib.most_popular_book
lib.who_takes_popular_books
