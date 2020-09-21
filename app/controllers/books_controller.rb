class BooksController < ApplicationController
  def index
    @books = Book.all.order(id: :"desc")
    @book = Book.new
  end

  def show
  end

  def edit
  end
end
