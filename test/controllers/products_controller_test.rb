# frozen_string_literal: true

require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = create(:product)
  end

  test 'should get index' do
    get products_url
    assert_response :success
  end

  test 'should create product' do
    assert_difference('Product.count') do
      post products_url(format: :js), params: { product: build(:product).attributes }
    end
  end

  test 'should update product' do
    patch product_url(@product, format: :js), params: { product: build(:product).attributes }
  end

  test 'should destroy product' do
    assert_difference('Product.count', -1) do
      delete product_url(@product, format: :js)
    end
  end
end
