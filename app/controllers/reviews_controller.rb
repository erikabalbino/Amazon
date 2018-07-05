class ReviewsController < ApplicationController
    before_action :authenticate_user!
    
    def create
        # render json: params
        @product = Product.find params[:product_id]
        @review = Review.new(review_params)

        @review.product = @product

        @review.user = current_user

        if @review.save
            redirect_to product_path(@product)
        else
            @reviews = @product.reviews.order(created_at: :desc)
            render "products/show"
        end
    end

    def destroy
        @review = Review.find params[:id]
        @review.destroy

        redirect_to product_path(@review.product)
    end

    def update
        @review = Review.find params[:id]
        @review.hidden: true

        if @review.update(review_params)

            redirect_to product_path(@review.product)
        else
            render :show
        end
        
    end

    private
    def review_params
        params.require(:review).permit(:body, :rating, :hidden)
    end

    def authorize_user!
        @review = Review.find params[:id]

        unless can?(:manage, @review)
            flash[:danger] = "Access Denied !!"
            redirect_to product_path(@review.product)
        end
    end
end
