class ProductsController < ApplicationController

    def new
        @product = Product.new
    end

    def create

        # render json: params
        @product = Product.new(products_params)

        if @product.save
            redirect_to product_path(@product.id)
        else
            render :new
        end
    end

    def show
        @product = Product.find params[:id]
    end

    def index
        @products = Product.all.order(created_at: :desc)
    end

    def destroy
        @product = Product.find params[:id]
        @product.destroy
        redirect_to products_path
    end

    def edit
        @product = Product.find params[:id]
    end

    def update
        @product = Product.find params[:id]
        
        if @product.update(products_params)
            redirect_to product_path(@product.id)
        else
            render :edit
        end
    end

    private
    def products_params
        params.require(:product).permit(:title, :description, :price)
    end

end
