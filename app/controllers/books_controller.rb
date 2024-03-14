class BooksController < ApplicationController
  def index
    @books = Book.page(params[:page]).per(10) # Adjust the number (10) as needed
  end
  

  def show
    @book = Book.find(params[:id]) 
  end
end