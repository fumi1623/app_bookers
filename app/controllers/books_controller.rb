class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params2)
    if book.save
      flash[:success] = "Book was successfully created."
      redirect_to book_path(book)
    else
      flash.now[:alert] = "No created"
      redirect_to books_path
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:update] = "Book was successfully updated."
      redirect_to book_path(book)
    else
      flash.now[:alert] = "No updated"
      redirect_to book_path(book)
    end
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

  def book_params2
  params.permit(:title, :body)
  end

end
