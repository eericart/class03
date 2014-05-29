class Product

	# attribute names should be title, price, category
	# where title is a String
	# where price is a Float
	# where category is a Symbol
  attr_accessor :title, :price , :category

  def initialize (title, price, category)
    raise TypeError unless title.is_a? String
    raise TypeError unless price.is_a? Float
    raise TypeError unless category.is_a? Symbol
    @title = title
    @price = price
    @category = category

  end

end