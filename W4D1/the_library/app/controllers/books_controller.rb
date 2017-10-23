class BooksController < ApplicationController
  def index
    @books = Book.all
    render :index
  end

  def new
    render :new
  end

  def create
    x = Book.new(book_params)
    if x.save
      redirect_to books_url
    else
      x.errors.full_messages
    end
  end

  def destroy
    x = Book.find(params[:id])
    x.destroy
    redirect_to books_url
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
