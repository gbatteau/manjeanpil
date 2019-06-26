class PagesController < ApplicationController
    # GET request for / which is our home page
    def home
      @customer_plan = Plan.find(1)
      @restaurant_plan = Plan.find(2)  
      @posts = Post.order(created_at: :desc)
    end
    
    def about
    end
end