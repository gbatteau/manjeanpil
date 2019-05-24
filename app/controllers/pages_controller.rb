class PagesController < ApplicationController
    def home
      @customer_plan = Plan.find(1)
      @restaurant_plan = Plan.find(2)  
    end
    
    def about
    end
end