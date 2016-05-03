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
    three_books = three_most_popular_books
    who_ord = @orders.map { |ord| ord.reader if three_books[0..2].include?(ord.book)}
    puts who_ord.compact.uniq
  end

  def most_popular_book
    puts three_most_popular_books[0]
  end

  def three_most_popular_books
    books_ordered = @orders.group_by {|ord_book| ord_book.book}
    ordered = books_ordered.max_by(3) {|k,v| v.count}
    three_books = ordered.map {|book| book[0]}
  end

  def stat_reader(book)#Who often takes the book
    ordereds = @orders.select {|order| order if order.book==book}
    orders = ordereds.group_by {|ord| ord.reader}
    orders.max_by {|k,v| v.count}.first
  end

  def add_obj(obj)
    instance_variable_get("@#{obj.class}s".downcase) << obj
  end

  def load_orders
    File.open('./db/orders.txt','r').each  do |o|
      order = o.split('-')
      @orders<<Order.new(order[0],order[1],order[2])
    end
  end

  def load_lib(class_name)
    File.open("./db/#{class_name.downcase}s.txt", "r").each do |f|
      row = f.split('-')
      instance_variable_get("@#{class_name}s")<<eval(class_name.capitalize).new(*row)
    end
  end

  def save_lib
    save_part_lib("books")
    save_part_lib("orders")
    save_part_lib("readers")
    save_part_lib("authors")
  end

  def save_part_lib(arr_name) 
    File.open("./db/#{arr_name}.txt", "a+") do |f|
      instance_variable_get("@#{arr_name}").map do |obj|
        inst_v = [] 
        obj.instance_variables.map {|inst| inst_v << obj.instance_variable_get(inst) }
        f << inst_v.join('-');
      end
    end
  end
end