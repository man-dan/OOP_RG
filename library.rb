require './book.rb'
require './order.rb'
require './reader.rb'
require './author.rb'

class Library
	attr_accessor :books, :orders, :readers, :authors

	def initialize
		@books, @orders, @readers, @authors = [], [], [], []
	end
	def add_book(book_obj)
		@books<<book_obj
	end
	def add_reader(reader_obj)
		@readers<<reader_obj
	end
	def add_order(order_obj)
		@orders<<order_obj
	end
	def add_author(author_obj)
		@authors<<author_obj
	end

	def load_books
		File.open('./db/books.txt','r').each  do |b|
			book = b.split('-')
			@books<<Book.new(book[0],book[1])
		end
	end
	def load_orders
		File.open('./db/orders.txt','r').each  do |o|
			order = o.split('-')
			@orders<<Order.new(order[0],order[1],order[2])
		end
	end
	def load_readers
		File.open('./db/readers.txt','r').each  do |r|
			reader = r.split('-')
			@readers<<Reader.new(reader[0],reader[1],reader[2],reader[3],reader[4])
		end
	end
	def load_authors
		File.open('./db/authors.txt','r').each  do |a|
			author = a.split('-')
			@authors<<Author.new(author[0],author[1])
		end
	end
	def save_lib
		save_books(books)
		save_orders(orders)
		save_readers(readers)
		save_authors(authors)
	end

	def save_books(books)
    	File.open("./db/books.txt", "a+") do |f|
      		books.each {|b| f<<[b.title,b.author].join('-')}
    	end
	end
    def save_orders(orders)
    	File.open("./db/orders.txt", "a+") do |f|
      		orders.each {|o| f<<[o.book,o.reader,o.date].join('-')}
    	end
  	end
  	def save_readers(readers)
    	File.open("./db/readers.txt", "a+") do |f|
      		readers.each {|r| f<<[r.name,r.email,r.city,r.street,r.house].join('-')}
    	end
  	end
  	def save_authors(authors)
    	File.open("./db/authors.txt", "a+") do |f|
      		authors.each {|a| f<<[a.name,a.biography].join('-')}
    	end
  	end
end