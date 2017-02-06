class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    #@user = User.new(params[:user])    # 実装は終わっていないことに注意!
    @user = User.new(user_params)
    if @user.save
      redirect_to @user # redirect_to user_url(@user)
    else
      render 'new'
    end
  end
  
  private
  
  def user_params #悪意ある攻撃を防ぐ
    params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
  end
end