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
    
  end

  def create
    # １. データを新規登録するためのインスタンス作成
    book = Book.new(book_params)
    # ２. データをデータベースに保存するためのsaveメソッド実行
    book.user_id = current_user.id
    book.save
    # ３. トップ画面へリダイレクト
    redirect_to book_path(book.id)
    # redirect_to '/'
  end

  private
  
  def books_params
    params.require(:user).permit(:name, :profile_image)
  end
  
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def destroy
    
  end
  

end
