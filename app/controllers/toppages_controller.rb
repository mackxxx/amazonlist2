class ToppagesController < ApplicationController
  skip_before_action :authenticate_user, only: [:index] 
  
  def index
    @items = Item.order(updated_at: :desc)
  end
end