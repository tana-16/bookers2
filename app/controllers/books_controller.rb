class BooksController < ApplicationController

  # def new
  #   @book = Book.new
  # end

  def index
    @books = Book.all
    # @books = Book.find(params[:id])
    @book = Book.new
  end

  def create
    # １. データを新規登録するためのインスタンス作成
    book = Book.new(list_params)
    # ２. データをデータベースに保存するためのsaveメソッド実行
    book.save
    # ３. トップ画面へリダイレクト
    redirect_to '/top'
  end

  private
  
  def books_params
    params.require(:user).permit(:name, :profile_image)
  end
  
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
  

end
