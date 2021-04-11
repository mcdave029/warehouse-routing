# frozen_string_literal: true

require 'test_helper'

class DestinationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @destination = create(:destination)
  end

  test 'should get index' do
    get destinations_url
    assert_response :success
  end

  test 'should create destination' do
    assert_difference('Destination.count') do
      post destinations_url(format: :js), params: { destination: build(:destination).attributes }
    end
  end

  test 'should update destination' do
    patch destination_url(@destination, format: :js), params: { destination: build(:destination).attributes }
  end

  test 'should destroy destination' do
    assert_difference('Destination.count', -1) do
      delete destination_url(@destination, format: :js)
    end
  end
end
