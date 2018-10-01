class Micropost < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length:{maximum: 140}
  has_many :likes, foreign_key: "micropost_id", dependent: :destroy
  has_many :comments, foreign_key: "micropost_id", dependent: :delete_all


  # いいね！
  def like(user)
    likes.create(user_id: user.id)
  end

  # いいね！取り消し
  def unlike(user)
    likes.find_by(user_id: user.id).destroy
  end
end
