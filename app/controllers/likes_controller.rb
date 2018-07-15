class LikesController < ApplicationController
    before_action(:authenticate_user!)

    def create
        # render json: params
        
        review = Review.find params[:review_id]

        # @product_id = @review.product_id
        # @product = Product.find(@product_id)

        unless can?(:like, review)
            flash[:danger] = " Are you liking your own review ?? 😱 😱 "
            return redirect_to product_path(review.product)
        end

        like = Like.new(user: current_user, review: review)

        if like.save 
            flash[:success] = "Review Liked ! ❤️ "
        else
            flash[:danger] = "Alredy Liked ! ❌ "
        end

        redirect_to product_path(review.product)
    end

    def destroy
        # render json: params

        like = Like.find params[:id]
        like.destroy

        flash[:success] =  "Review unliked ! 💔 "
        redirect_to product_path(like.review.product)

    end

end
