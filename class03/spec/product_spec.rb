require 'spec_helper.rb'

describe Product do

	before :all do
		@product = Product.new "Manzana", 9.99, :fruta
	end

	describe "When creating a new a product" do
		context "With valid parameters" do
			it "should take 3 parameters and return a product object" do
				expect(@product).to be_kind_of(Product)
			end
		end
	end

	describe "#title" do
		it "should return the correct title" do
			# the name of the object created in the each block is asserted.
			expect(@product.title).to eql("Manzana")
		end
		it "should be a string" do
			# the name should be of the class String
			expect(@product.title).to be_kind_of(String)
		end
	end

	describe "#price" do
		it "should return the correct price"
			# the price of the object created in the each block is asserted.
			expect(@product.price).to eql(9.99)
		it "should be a float" do
			# the price should be of the class Float
			expect(@product.price).to be_kind_of(Float)
		end
	end

	describe "#category" do
		it "should return the correct category"
			# the category of the object created in the each block is asserted.
			expect(@product.category).to eql(:fruta)
		it "should be a symbol" do
			# the category should be of the class Symbol
			expect(@product.category).to be_kind_of(:Symbol)
		end
	end

end