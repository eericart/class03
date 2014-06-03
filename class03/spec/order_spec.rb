require 'spec_helper.rb'

describe Order do

	before :all do
		orders = [
			Product.new("Mouse", 21.00, :electronics),
			Product.new("Keyboard", 25.00, :electronics),
			Product.new("Bed", 111.00, :home),
			Product.new("Pen", 1.50, :office),
			Product.new("Key", 4.20, :home),
			Product.new("Printer", 121.00, :electronics)
		]
		File.open "products.yml", 'w' do |f|
			f.write YAML::dump orders
		end
	end

	before :each do
		# instantiate a new order while loading the products.yml file
		@order = Order.new "products.yml"
	end

	describe "When creating a new Order" do

		context "with no parameters" do
			it "has no products" do
				# A new order instantiated with no yml file should have 0 products
				orden = Order.new
				expect(orden.products).to be_empty
			end
		end

		context "with a YAML file" do
			it "has 6 products" do
				# A new order instantiated with a yml file should have 6 products
				expect(@order.products.count).to eql(6)
			end
		end

	end

	describe "When working with orders" do

		it "can filter products by category" do
			# assertion for this method should be against the quantity of objects returned
			expect(@order.filter_by_category(:electronics).count).to eql(3)
		end

		it "can add & retrieve new products " do
			# assertion for this method should be agaist the instance class of the returned object we save.
			product = @order.add_product "Manzana", 9.99, :fruta
			expect(@order.products.last).to eql(product)
		end

		it "can get products by a price range" do
			# assertion for this method should be against the quantity of objects returned
			expect(@order.filter_by_price(4.20,25.00).count).to eql(3)
		end

		it "can save your order to a file" do
			# Save the order to a file, retrieve it and then compare with the previous
			@order.save("test_products.yml")
			orden = Order.new "test_products.yml"
			expect(@order.products).to match_array(orden.products)
		end
	end


end