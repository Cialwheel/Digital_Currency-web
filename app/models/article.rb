class Article < ApplicationRecord
  validates :title, presence: true, length: {minimum:3}
  has_many :comments
  belongs_to :user
  has_many :likes, :dependent => :destroy
  has_many :liked_users, :through => :likes, :source => :user
  mount_uploader :logo, ArticleLogoUploader
  mount_uploaders :images, ArticleImageUploader
  serialize :images, JSON

  def find_like(user)
    self.likes.where( :user_id => user.id ).first
  end
end
