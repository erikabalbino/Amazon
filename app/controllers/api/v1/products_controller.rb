class Api::V1::ProductsController < Api::ApplicationController

    before_action :authenticate_user!, except: [:index, :show]
    
    def index
        products = Product.order(created_at: :desc)

        render(
            json: products,
            each_serializer: ProductCollectionSerializer
        )
    end

    def show
        render(
            json: product,
            include:[ :seller, { reviews: [ :author ] }]
        )
    end

    def create
        product = Product.new product_params

        product.user = current_user

        if product.save
            render json: { id: product.id }
        else
            render(
                json: { errors: product.errors}, 
                status: 422 # Unprocessable Entity
            )
        end
    end

    def destroy
        product.destroy
        render(json: { status: 200 }, status: 200)
    end
    
    private

    def product
        @product ||= Product.find params[:id]
    end

    def product_params
        params.require(:product).permit(:title, :description)
    end

end
