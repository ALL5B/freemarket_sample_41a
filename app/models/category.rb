class Category < ApplicationRecord
  has_ancestry
  has_many :products
  belongs_to :sizetype,optional: true

end
