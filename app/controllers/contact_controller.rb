class ContactController < ApplicationController

    def index

    end

    def create
        @name = params[:full_name]
    end

end
