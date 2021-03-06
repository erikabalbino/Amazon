class User < ApplicationRecord

    has_secure_password

    has_many :favourites, dependent: :destroy
    has_many :favourited_products, through: :favourites, source: :product 


    has_many :products, dependent: :nullify
    has_many :reviews, dependent: :nullify

    has_many :likes, dependent: :destroy
    has_many :liked_reviews, through: :likes, source: :review 

    validates :first_name, :last_name, presence: true

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates(
        :email,
        presence: true,
        uniqueness: true,
        format: VALID_EMAIL_REGEX
    )
    
    def full_name
        first_name + " " + last_name
    end
end
