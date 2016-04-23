require './book.rb'
require './order.rb'
require './reader.rb'
require './author.rb'

class Library
	attr_accessor :books, :orders, :readers, :authors

	def initialize
		@books, @orders, @readers, @authors = [], [], [], []
	end
	def who_takes_popular_books
		three_books=three_most_popular_books
		who=[]
		@orders.each do |r| 
			three_books.each {|k,v| who<<r.reader if k==r.book}
		end
		puts who.uniq!
	end
	def most_popular_book
		arr=three_most_popular_books.max_by{|k,v| v}
		puts arr
	end
	def three_most_popular_books
		books=[]
		@orders.each {|b| books<<b.book}
		books.each_with_object(b=Hash.new(0)){|book| b[book]+=1}
		c=Hash.new
		b.sort {|a,b| b[1]<=>a[1]}.each_with_index{|(k,v),i| c[k]=v if i<3}
		c
	end
	def stat_reader(book)#Who often takes the book
		readers_stat = Hash.new(0)
		@orders.each do |r| 
			readers_stat[r.reader] +=1 if r.book==book
		end
		reader_v = readers_stat.values.max
		readers_stat.each {|k,v| puts k if v==reader_v}		
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