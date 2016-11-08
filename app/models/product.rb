class Product < ActiveRecord::Base

	def self.sort_by_category
		categories = Product.pluck(:category).uniq
		category_hash = {}
		categories.each do |category|
			category_hash[category] = Product.where('category = ?', category)
		end
		return category_hash
	end


	def self.calculate_total_price
		sum = 0 
		Product.all.each do |product|
			sum += product.price 
		end
		return sum 
	end
end
