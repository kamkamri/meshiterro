class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # アソシエーション関連を持っているモデル同士の記述方法
    # 複数形になっているのはhas_many :post_images　になっているから
    # ユーザーが投稿した投稿
    @post_images = @user.post_images
  end

  def edit
  end
end
