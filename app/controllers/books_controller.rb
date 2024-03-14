class BooksController < ApplicationController
  def index
    @books = Book.page(params[:page]).per(10) # Adjust the number (10) as needed
  end
  

  def show
    @book = Book.includes(:library_branch, :reviews).find(params[:id])
  end
end