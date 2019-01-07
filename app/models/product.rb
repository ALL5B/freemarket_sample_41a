class Product < ApplicationRecord
  belongs_to :user,foreign_key => "seller"
  has_many :product_images
  belongs_to :category
  belongs_to :area
  belongs_to :size
end
