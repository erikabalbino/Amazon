class Product < ApplicationRecord

    validates(
        :title,
        presence: true,
        uniqueness: { case_sensitive: false }
    )

    validates(
        :price,
        numericality: {
            greater_than: 0
        }
    )

    validates(
        :description,
        presence: true,
        length: {
            minimum: 10
        }
    )

    before_validation :set_default_price, :capitalize_product

    private

    def set_default_price
        self.price ||= 1
    end

    def capitalize_product
        self.title.capitalize!
    end    

end
