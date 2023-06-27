class UsersController < ApplicationController
  def index
    @users = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    #1行目:@userに、find params:idでUserのパラメータを送る
    #2行目:@booksに、booksのテーブル情報を@userに関連付けて代入する
  end

  def edit
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to user_path(current_user)
    end
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path
    end
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:user_update] = "You  have updated user successfully."
      redirect_to user_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end



end
