class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_manyモデル名（1：NのNの方のモデルなので必ず複数形）
  has_many :post_images, dependent: :destroy
end
