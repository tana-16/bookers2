class BooksController < ApplicationController

  # def new
  #   @book = Book.new
  # end

  def index
    @books = current_user
    # @books = Book.all
    # @books = Book.find(params[:id])
    @book = Book.new
    @bookk = Book.all
  end

  def show
    # @books = current_user
    @books = Book.find(params[:id])
    # @books = Book.find(params[:id])
    @book = Book.new
    @user = @books.user
    # @bookk = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    @user = @book.user
    redirect_to books_path
  end
  

  def create
    # １. データを新規登録するためのインスタンス作成
    book = Book.new(book_params)
    # ２. データをデータベースに保存するためのsaveメソッド実行
    book.user_id = current_user.id
    if book.save
      redirect_to book_path(book.id)
    else
      render :new
    end

  end

  private

  # def book_params
  #   params.require(:user).permit(:name, :profile_image, :introduction)
  # end

  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
    # params.require(:user).permit(:name, :profile_image, :introduction)
  end


end
