require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
#SETUP
  # Create placeholder products
  before :each do
    @category = Category.create! name: 'Apparel'
    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99,
      )
    end
  end

  scenario "They can add products to cart" do
    #ACT
    visit root_path
    expect(page).to have_link 'My Cart (0)', count: 1
    click_button("Add", match: :first)

    #DEBUG / VERIFY
    expect(page).to have_link 'My Cart (1)', count: 1
    # save_and_open_screenshot
  end
end

#visit home page
# click add cart
#my cart increase