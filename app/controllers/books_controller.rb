class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
  if @book.errors.any?
    flash.now[:error] = "エラーメッセージを表示するメッセージ"
    render :index
  end
  end

  def show
  	@book = Book.find(params[:id])
  end

  def create
  @book = Book.new(book_params)

  if @book.save
    redirect_to @book, notice: 'Book was successfully created.'
  else
    @books = Book.all
    render :index
  end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
  @book = Book.find(params[:id])
  if @book.update(book_params)
  flash[:notice] = "Book was successfully updated."
  render :show
  else
    @books = Book.all
    render :new
  end
  end

  def destroy
  	@book = Book.find(params[:id])
  	@book.destroy
  	redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
