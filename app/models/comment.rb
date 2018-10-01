class Comment < ActiveRecord::Base
  validates :user_id, presence: true
  validates :micropost_id, presence: true
  validates :content, presence: true, length: {maximum: 100}
  belongs_to :user
  belongs_to :micropost
  has_many :replies, class_name: "Comment", foreign_key: "parent_id", dependent: :destroy
  # optional:trueでparent_idがnilであることを許容する
  belongs_to :parent, class_name: "Comment"
end
