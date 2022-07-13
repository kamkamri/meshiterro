class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # アソシエーション関連を持っているモデル同士の記述方法
    # 複数形になっているのはhas_many :post_images　になっているから
    # ユーザーが投稿した投稿
    @post_images = @user.post_images.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
