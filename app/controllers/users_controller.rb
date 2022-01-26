class UsersController < ApplicationController
  def new
    @book=Book.new
  end
  def create
    @book=Book.new(params_path)
    @book.user_id=current_user.id
    if@book.save
      redirect_to user_path
    else
      render :index
    end
  end
  def index
    @users=User.all
    @user=current_user
    @book=Book.new
  end

  def edit
    @user=User.find(params[:id])
    if @user!=current_user
      redirect_to user_path(current_user)
    end
  end

  def update
    @user=User.find(params[:id])
    if @user.update(params_path)
      flash[:notice]="You have updated book successfully."
     redirect_to user_path(@user)
    else
      render :edit
    end
  end
  def show
    @user=User.find(params[:id])
    @books=@user.books
    @book=Book.new

  end
  private
  def params_path
    params.require(:user).permit(:name,:introduction,:profile_image)
  end
end
