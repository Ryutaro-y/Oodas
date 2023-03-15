class SearchesController < ApplicationController
    def search
        @range = params[:range]
        @search_term = params[:search]
        @word = params[:word]

        if @word.present?
            case @range
            when "Ink"
                @inks = Ink.looks(@search_term, @word)
            when "Location"
                @locations = Location.looks(@search_term, @word)
            when "Order"
                @orders = Order.looks(@search_term, @word)
            when "Stock"
                @stocks = Stock.looks(@search_term, @word)
            when "Supplier"
                @suppliers = Supplier.looks(@search_term, @word)
            else
                @users = User.looks(@search_term, @word)
            end

            if @inks.blank? && @locations.blank? && @orders.blank? && @stocks.blank? && @suppliers.blank? && @users.blank?
                flash.now[:error] = "該当するものがありません。"
            end
        else
            flash.now[:error] = "検索ワードを入力してください。"
        end

    end
end
