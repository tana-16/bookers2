class BooksController < ApplicationController

  def index
    @user = current_user
    @books = Book.all
    # @books = Book.find(params[:id])
    @book = Book.new

  end

  def show
    @books = Book.find(params[:id])
    @book = Book.new
    @user = @books.user
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save
      flash[:success] = 'You have updated book successfully.'
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @user = @book.user
    if @book.destroy
      redirect_to books_path
    else
      render:edit
    end

  end


  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:success] = 'You have created book successfully.'
      redirect_to book_path(@book.id)
    else
      @user = current_user
      @books = Book.all
      render :index
    end

  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)

  end


end
