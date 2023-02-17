class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    if user_signed_in?
      @foods = current_user.house.house_foods.where("expiry_date <= ?", Date.today + 2)
      @unseen_items = current_user.house.items.where.not(user: current_user).where.not(seen: true)
      flash.delete(:alert)
    end
    #@items.update_all(seen: true)
  end
end
