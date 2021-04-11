# frozen_string_literal: true

require 'application_system_test_case'

class ProductsTest < ApplicationSystemTestCase
  setup do
    create_list(:product, 2)
    @product = build(:product)
  end

  test 'visiting the index' do
    visit products_url
    assert_selector 'h1', text: 'Products'
  end

  test 'creating a Product' do
    visit products_url

    within('#new_product') do
      fill_in id: 'product_name', with: @product.name
      fill_in id: 'product_price', with: @product.price
      select @product.reference, from: 'product_reference'
      select @product.category, from: 'product_category'
      click_on 'Create Product'
    end

    assert_text 'Product was successfully created'
  end

  test 'updating a Product' do
    visit products_url
    click_on 'Edit', match: :first

    within('#edit_product') do
      fill_in id: 'product_name', with: @product.name
      fill_in id: 'product_price', with: @product.price
      select @product.reference, from: 'product_reference'
      select @product.category, from: 'product_category'
      click_on 'Update Product'
    end

    assert_text 'Product was successfully updated'
  end

  test 'destroying a Product' do
    visit products_url
    page.accept_confirm do
      click_on 'Delete', match: :first
    end

    assert_text 'Product was successfully deleted'
  end
end
