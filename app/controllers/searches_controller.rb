class SearchesController < ApplicationController
    def search
        @range = params[:range]

        if @range == "Ink"
            @inks = Ink.looks(params[:search], params[:word])
        elsif @range == "Location"
            @locations = Location.looks(params[:search], params[:word])
        elsif @range == "Order"
            @orders = Order.looks(params[:search], params[:word])
        elsif @range == "Stock"
            @stocks = Stock.looks(params[:search], params[:word])
        elsif @range == "Supplier"
            @suppliers = Supplier.looks(params[:search], params[:word])
        else
            @users = User.looks(params[:search], params[:word])
        end

    end
end
