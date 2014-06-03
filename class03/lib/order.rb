require 'yaml'
require_relative 'product.rb'

class Order
	attr_accessor :products

	# Remember that working with YAML files YAML::load and YAML::dump are your friends!

	def initialize (file_path="")
	  	# loading or not loading should be the key here.
      @products = !file_path.empty? ? YAML.load_file(file_path) : []
    end

    def filter_by_category (category)
    	# Perhaps you could use the select method for arrays :)
      products.select {|product| product.category == category }
    end

    def filter_by_price (begin_price, final_price)
    	# Perhaps the select method could work here too!
      products.select {|product| product.price.between? begin_price,final_price}

    end

    def add_product (title, price, category)
      # Remember stacks & queues? Pushing might be the answer.
      new_product = Product.new title, price, category
      products << new_product
      new_product
    end

    def get_product
    	# you query products by a product title but the catchy thing here is
    	# that if there are multiple matches only the first one is returned.
        products.select {|product| product.title == title }.first
    end

    def save (file_path)
      File.open file_path, 'w' do |f|
        f.write YAML::dump products
      end
    end
end