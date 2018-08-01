class TagsController < ApplicationController

    def index
        # render json: params
        @tags = Tag.all.order(name: :asc)
    end

    def show
        # render json: params
        @tag = Tag.find params[:id]

        @products = @tag.products
    end
end
