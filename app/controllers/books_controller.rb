class BooksController < ApplicationController
  def index
    @books = Book.all
    #newに書いてたやつ、ルーティングはこのままで良さそう
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to books_path(book.id)
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    #@book = Book.new #ここじゃなさそう
  end

  def edit
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end