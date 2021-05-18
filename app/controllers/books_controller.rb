class BooksController < ApplicationController
  
  def show
    @book = Book.find(params[:id])
  end
  
  def index
    @books = Book.all
    @book = Book.new
  end
  
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
       redirect_to book_path(@book), notice: "Book was successfully created."
      else
       @books=Book.all
       @book=Book.new
       render 'index'
    end
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save
       redirect_to book_path(@book), notice: "Book was successfully updated."
      else
       render 'edit'
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to books_path 
  end
  
  private
  def book_params
      params.require(:book).permit(:title, :body)
  end
end