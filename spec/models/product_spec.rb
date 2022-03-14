require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "Validations" do
    it "should have a name" do
      @product = Product.new({name: nil, description: "A brown Couch", price_cents: 10000, quantity: 2, category_id: 2})
      puts @product.errors.full_messages
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "should have a price" do
      @product = Product.new({name: "Couch", description: "A brown Couch", price_cents: nil, quantity: 2, category_id: 2})
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it "should have a quantity" do 
      @product = Product.new({name: "Couch", description: "A brown Couch", price_cents: 10000, quantity: nil, category_id: 2})
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "should belong to a category" do
      @category = Category.create(name: "Seating")
      @product = Product.new({name: "Couch", description: "A brown Couch", price_cents: 10000, quantity: 2, category_id: nil})
      expect(@product).not_to be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

    it "should create a new product" do
      @category = Category.create(name: "Seating")
      @product = Product.new({name: "Couch", description: "A brown Couch", price_cents: 10000, quantity: 2, category_id: @category.id})
      expect(@product).to be_valid
    end
  end
end
