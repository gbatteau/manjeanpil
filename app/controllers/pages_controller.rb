class PagesController < ApplicationController
  def home
    @customer_plan = Plan.find_by(name: 'customer')
    @restaurant_plan = Plan.find_by(name: 'restaurant')
    @posts = Post.order(created_at: :desc)
  end

  def about
  end
end
