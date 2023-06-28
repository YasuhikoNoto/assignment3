class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
      if @book.save
        flash[:book_save] ="You have created book successfully."
        redirect_to book_path(@book)
      else
        @books = Book.all
        render :index
      end
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @book_new = Book.new
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
    @user = @book.user
    unless @user.id == current_user.id
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:book_update] = "You have updated book successfully."
      redirect_to book_path
    else
      render :edit
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
    #params.require(:book).permit(:title, :body)
    #.require(:book)をつけるとparams missingエラーが出るので、推奨される方法ではないらしいがいったん削除
    #formがBook.newを受けとれていないっぽい？ いろいろ試したがダメなので
    #Book.new がちゃんとあるか確認  対応アクション全てに　すでに@bookを定義済みの場合はなんでもよいのでBook.new追加

  end

end
