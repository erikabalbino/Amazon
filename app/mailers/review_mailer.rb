class ReviewMailer < ApplicationMailer

    def notify_product_owner_new_review(review)
        @review = review
        @product = review.product
        @product_owner = @product.user

        mail(
            to: @product_owner.email,
            subject: "You got a new review on your product "
        )

    end
end
