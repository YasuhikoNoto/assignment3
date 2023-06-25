class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update
    redirect_to book_path
  end

  private

  def book_params
    params.permit(:title, :body)
    #params.require(:book).permit(:title, :body)
    #.require(:book)をつけるとparams missingエラーが出るので、推奨される方法ではないらしいがいったん削除
    #formがBook.newを受けとれていないっぽい？ いろいろ試したがダメなので

  end

end
