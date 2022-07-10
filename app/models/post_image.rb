class PostImage < ApplicationRecord
  # かくレコードとファイルを1：1の関係で紐付けするメソッド
  # この記述によりモデル.ファイル名で添付されたファイルにアクセスできるようになる
  # またこのファイル名は、そのモデルが紐づいたフォームから送られるパラメータキーになる
  has_one_attached :image
  # belongs_to モデル名（N：1の1の方のモデルなので必ず単数形）
  belongs_to :user
  
  def get_image
    # unless・・・条件分岐もし評価が偽であれば
    # image.attaches?　画像添付
    # 画像添付がない場合は、app/assets/imagesに格納されたno_image.jpgという画像を
    # デフォルト画像としてActiveStorageに格納し、格納した画像を表示する
    unless image.attached?
      # Rails.root.join(~) ~にルート以下のパスを指定する
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    e
      image
    end
  end
end
