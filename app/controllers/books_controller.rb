class BooksController < ApplicationController

def show
  @book = Book.includes(:library_branch, :reviews).find(params[:id])
end

def index
  if params[:search].present?
    @books = Book.where('title LIKE ?', "%#{params[:search]}%")
  else
    @books = Book.all
  end
  @books = Book.page(params[:page]).per(10) 
  end
end
