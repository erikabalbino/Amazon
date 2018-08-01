class ProductsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    before_action :find_product, only: [:show, :edit, :update, :destroy]
    before_action :authorize_user!, only: [:edit, :update, :destroy]
    
    def new
        @product = Product.new
    end

    def create

        # render json: params
        @product = Product.new(products_params)

        @product.user =current_user

        if @product.save

            ProductMailer
            .notify_product_owner(@product)
            .deliver_now


            redirect_to product_path(@product.id)
        else
            render :new
        end
    end

    def show
        # @product = Product.find params[:id]

        @tags = @product.tags.order(name: :asc)

        @review = Review.new
        @reviews = @product.reviews.order(created_at: :desc)

        @favourite = @product.favourites.find_by(user: current_user)
    end

    def index
        @products = Product.all.order(created_at: :desc)
    end

    def destroy
        # @product = Product.find params[:id]
        @product.destroy
        redirect_to products_path
    end

    def edit
        # @product = Product.find params[:id]
    end

    def update
        # @product = Product.find params[:id]
        
        if @product.update(products_params)
            redirect_to product_path(@product.id)
        else
            render :edit
        end
    end

    private
    def products_params
        params.require(:product).permit(:title, :description, :price, tag_ids: [])
    end

    def find_product
        @product = Product.find params[:id]
    end

    def authorize_user!

        unless can?(:crud, @product)
            flash[:danger] = "Access Denied!!"
            redirect_to product_path(@product)
        end

    end

end
