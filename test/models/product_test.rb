# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id             :bigint           not null, primary key
#  category       :string
#  name           :string
#  price          :decimal(10, 2)
#  reference      :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  destination_id :bigint
#
# Indexes
#
#  index_products_on_destination_id  (destination_id)
#
# Foreign Keys
#
#  fk_rails_...  (destination_id => destinations.id)
#
require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  context 'associations' do
    should belong_to(:destination).optional
  end

  context 'validations' do
    should validate_uniqueness_of(:name)
    should validate_presence_of(:name)
    should validate_presence_of(:price)
    should validate_presence_of(:reference)
    should validate_presence_of(:category)
    should validate_inclusion_of(:reference).in_array(Constants::REFERENCES)
    should validate_inclusion_of(:category).in_array(Constants::CATEGORIES)
  end
end
