class ProductSerializer < ActiveModel::Serializer
  attributes(:id,
    :title,
    :description,
    :price,
    :favourite_count,
    :created_at,
    :updated_at
  )

  belongs_to(:user, key: :seller)
  has_many :reviews

  class ReviewSerializer < ActiveModel::Serializer
    attributes(:id,
      :body,
      :rating,
      :created_at,
      :updated_at
    )

    belongs_to(:user, key: :author)
  end

  def favourite_count
    object.favourites.count
  end
end

