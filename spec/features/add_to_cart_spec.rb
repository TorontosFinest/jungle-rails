require 'rails_helper'

RSpec.feature "adds item to cart", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
          image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end

   scenario "They see all products" do
    visit root_path
    save_screenshot
    expect(page).to have_content('My Cart (0)')
    click_button('Add')
    save_screenshot
    expect(page).to have_content('My Cart (1)')
    save_screenshot
  end
end