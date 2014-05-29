class Order
	attr_accessor :products

	# Remember that working with YAML files YAML::load and YAML::dump are your friends!

	def initialize (file_path="")
	  	# loading or not loading should be the key here.
        @products = []
        unless file_path.empty?
            File.open(file_path, "r").each do |product|
                products << YAML::load(product)
            end
        end
    end

    def filter_by_category (category)
    	# Perhaps you could use the select method for arrays :)
        products.select {|product| product.category == category }
    end

    def filter_by_price (begin_price, final_price)
    	# Perhaps the select method could work here too!
        products.select {|product| product.pirce >= begin_price and product.price <= final_price }
    end

    def add_product (title, price, category)
      # Remember stacks & queues? Pushing might be the answer.
      products.push(Product.new title, price, category)
    end

    def get_product
    	# you query products by a product title but the catchy thing here is
    	# that if there are multiple matches only the first one is returned.
        products.select {|product| product.title == title }.first
    end

    def save
        File.open "products.yml", 'w' do |f|
           f.write YAML::dump products
        end
    end
end