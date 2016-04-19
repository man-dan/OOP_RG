require './book.rb'
require './order.rb'
require './reader.rb'
require './author.rb'

class Library
	attr_accessor :books, :orders, :readers, :authors

	def initialize
		@books, @orders, @readers, @authors = [], [], [], []
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
end