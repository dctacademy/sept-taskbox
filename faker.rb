5.times do 
	client = Client.new
	client.name = Faker::Name.name 
	client.email = Faker::Internet.email
	client.mobile = Faker::Number.number(10)
	client.company = Faker::Company.name
	client.website = "www.#{Faker::Internet.domain_name}"
	client.user_id = User.all.pluck(:id).sample
	client.save
end

20.times do 
	project = Project.new
	project.name = Faker::App.name
	project.description = Faker::Lorem.paragraph
	project.start_date = Faker::Date.between(Date.today.beginning_of_year, Date.today)
	project.client_id = Client.all.sample.id 
	project.status = ["new", "on-going", "completed"].sample
	project.user_id = User.all.pluck(:id).sample
	project.save
end

1000.times do 
	product = Product.new 
	product.name = Faker::Commerce.product_name
	product.price = Faker::Commerce.price(100..1000)
	product.category = Faker::Commerce.department(1)
	product.save
end