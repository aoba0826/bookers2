class BooksController < ApplicationController
  def index
    @books=Book.all
    @book=Book.new
    @book.user_id=current_user.id
    @user=@book.user

  end
  def new
    @book=Book.new
  end

  def create
  @book=Book.new(params_path)
  @book.user_id=current_user.id
  @books=Book.all
  @user=@book.user
    if@book.save
      flash[:notice]="You have created book successfully."
      redirect_to book_path(@book)
    else
      render :index
    end
  end

  def show
    @new_book=Book.new
    @book=Book.find(params[:id])
    @user=@book.user
  end
  def destroy
    @book=Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def edit
    @book=Book.find(params[:id])
    if @book.user!=current_user
      redirect_to books_path
    end
  end

  def update
    @book=Book.find(params[:id])
      if@book.update(params_path)
      flash[:notice]="You have updated book successfully."
      redirect_to book_path(@book)
      else
        render :edit
      end
  end
  private
  def params_path
    params.require(:book).permit(:title,:body)
  end
end
