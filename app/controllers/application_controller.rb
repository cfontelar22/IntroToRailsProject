class ApplicationController < ActionController::Base

    def search
        @books = Book.where('title LIKE ?', "%#{params[:query]}%")
        render 'books/index'
      end

end
