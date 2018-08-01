class FavouritesController < ApplicationController

    before_action :authenticate_user!

    def create
        # render json: params

        product = Product.find params[:product_id]

        unless can?(:favourite, product)
            flash[:danger] = "Can't favourite this product ! 🚫 "
            return redirect_to product_path(product)
        end
        
        favourite = Favourite.new(user: current_user, product: product)

        if favourite.save
            flash[:success] = "Product favourited ! ❤️   👏 "
        else
            flash[:danger] = "Already favourited ! 🚫 "
        end

        redirect_to product_path(product)
    end

    def destroy
        # render json: params
        favourite = Favourite.find params[:id]
        favourite.destroy

        flash[:success] = "Favourite removed! 😢 "
        redirect_to product_path(favourite.product)
    end

    def index
        @favourites = current_user.favourited_products
    end

end
