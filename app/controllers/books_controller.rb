class BooksController < ApplicationController
  def index
    @books = Book.all.order(id: :"asc")
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
    redirect_to book_path(@book.id)
    flash[:notice] = "successfully posted"
    else
    @books = Book.all.order(id: :"asc")
    render "index"
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book)
      flash[:notice] = "successfully updated"
    else
      render "edit"
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
    flash[:notice] = "successfully deleted"
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end

end
