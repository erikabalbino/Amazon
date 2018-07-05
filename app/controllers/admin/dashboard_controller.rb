class Admin::DashboardController < ApplicationController

    before_action :authenticate_user!
    before_action :authorize_admin!

    def index
        @users = User.all

        @countUsers = User.count
        @countProducts = Product.count
        @countReviews = Review.count

        @products = Product.all

    end

    private
    def authorize_admin!
        unless current_user.admin?
            flash[:danger] = "Access Denied !!"
            redirect_to home_path
        end
    end

end
