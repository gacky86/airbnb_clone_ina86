class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :requests, dependent: :destroy
  has_many :houses, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_houses, through: :bookmarks, source: :house
  # source オプションは、中間テーブル（bookmarks）を通じて関連付ける「実際の関連先」を指定します。
  # この場合、bookmarks テーブルには house に関連する情報が含まれているため、source: :house を指定します。
  # User モデルの bookmarked_houses アソシエーションを呼び出すと、bookmarks テーブルを経由して、関連付けられた House レコードを取得します。
  # つまり、user.bookmarked_houses を呼び出すと、そのユーザーがブックマークした全ての家（House）が取得できます。

  has_one_attached :photo

  # user.own?(house)でuserがhouse.userと一致するかを返す
  def own?(object)
    id == object.user_id
  end

  def bookmark(house)
    bookmarked_houses << house
  end

  def unbookmark(house)
    bookmarked_houses.delete(house)
  end

  def bookmark?(house)
    bookmarked_houses.include?(house)
    # Bookmark.where(user_id: id, house_id: board.id).exists?と同じ
  end
end
