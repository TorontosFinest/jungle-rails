require "rails_helper"

RSpec.describe Product, type: :model do
  describe 'Validations' do


    it("saves with all valid fields") do 
        @category = Category.new name: 'Sports'
        @new_product = Product.new(name: 'soccer ball', price: 12.99, quantity: 20, category:@category)
        expect(@new_product).to be_valid
    end

    it("validates that there is a price") do 
    @product = Product.new
    @category = Category.new name: 'Sports'
    @product.price = nil
    expect(@product).to be_invalid
    expect(@product.errors.messages[:price]).to include("can't be blank")
    end

    it("validates that there is a category") do 
    @product = Product.new
    @category = Category.new name: 'Sports'
    @product.category = nil
    expect(@product).to be_invalid
    expect(@product.errors.messages[:category]).to include("can't be blank")
    end

     it("validates that there is a name") do 
    @product = Product.new
    @category = Category.new name: 'Sports'
    @product.name = nil
    expect(@product).to be_invalid
    expect(@product.errors.messages[:name]).to include("can't be blank")
    end

     it("validates that there is a quantity") do 
    @product = Product.new
    @category = Category.new name: 'Sports'
    @product.quantity = nil
    expect(@product).to be_invalid
    expect(@product.errors.messages[:quantity]).to include("can't be blank")
    end

end
end