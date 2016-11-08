class SandboxController < ApplicationController
  def clients
  	@clients = Client.all
  	#binding.pry
  end

  def projects
  end

  def products 
  	#@products_sum = Product.sum(:price)
  	@products_sum = Product.calculate_total_price	
  	@categories = Product.pluck(:category).uniq
  	@products_by_categories = Product.sort_by_category
  	@products_under_499 = Product.where('price < ?', 499)
  	@products_category = Product.where('price < ? AND category = ?', 499, "Toys")
  	@categories = Product.pluck(:category).uniq  	
  end
end
