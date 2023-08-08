class Photograph < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  validates :title, presence: true
  validates :date, presence: true
  validates :images, length: { minimum: 1, maximum: 5, message: "は1枚以上5枚以下にしてください" }

    
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }

end
