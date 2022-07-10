class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_manyモデル名（1：NのNの方のモデルなので必ず複数形）
  has_many :post_images, dependent: :destroy

  # ActiveStorageを使い画像をアップロードできるようにする
  has_one_attached :profile_image

  def get_profile_image(width,height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    # 画像のサイズ変更(引数)をおこなっている
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

end
