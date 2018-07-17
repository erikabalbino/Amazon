class Tagging < ApplicationRecord
  belongs_to :tag
  belongs_to :product

  validates :product_id, uniqueness: { scope: :tag_id}
end
