class UsersController < ApplicationController
  
  def show # 追記
    #　paramsの内容は{id:8}とか
    #　/users/:id　というURLでアクセスしてきている。
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if  @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user # ここを修正
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:info] = 'メッセージを保存しました'
      redirect_to @user
    else
      flash[:danger] = 'この内容は登録できません'
      render 'edit'
    end
  end
  

  private
  
  def user_params
    # TODO :areaと:profileをpermitに入れます。
    params.require(:user).permit(:name, :email, :profile,
    :area, :password, :password_confirmation)
  end
end

