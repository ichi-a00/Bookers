class BooksController < ApplicationController
  def index
    @books = Book.all
    #newに書いてたやつ、ルーティングはこのままで良さそう
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      @books = Book.all #ルーティングを通らないので@books=Book.allが飛ばない、どうするか？？？
      #binding.pry
      render :index
    end

    #book = Book.new(book_params)
    #book.save
    #redirect_to books_path(book.id)
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    #@book = Book.new #ここじゃなさそう
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book)
    else
      render :edit
    end
    #book = Book.find(params[:id])
    #book.update(book_params)
    #redirect_to book_path(book)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end