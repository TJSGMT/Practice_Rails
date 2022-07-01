class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index, :destroy]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(books_params)
    if @book.save
      redirect_to books_path
    else
      flash[:notice] = @book.errors.full_messsage
      redirect_to new_book_path
    end
  end

  def show
  end

  def edit
  end

  def update
    @book.update(books_params)
    redirect_to books_path
  end

  def destroy
    if current_user
      @book.destroy
      redirect_to books_path, status: :see_other
    else
      flash[:alert] = "you need to sign-in"
      redirect_to new_user_session_path
    end
  end

  private

  def find_book
    @book = Book.find(params[:id])
  end

  def books_params
    params.require(:book).permit(:name, :description, :price)
  end

  def current_ability
    current_ability ||= Ability.new(current_user)
  end
end

#  Routes.rb

# get 'books_path'
# get 'edit_path'
# delete 'destroy-book'

# get 'sign_in_path'
