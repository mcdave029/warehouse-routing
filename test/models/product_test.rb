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

  test 'route the right destination per reference and category' do
    destn_one = create(:destination, categories: %w[CAT_0 CAT_1 CAT_2], references: %w[REF_0 REF_1 REF_2])
    destn_two = create(:destination, categories: %w[CAT_2 CAT_3], references: %w[REF_2 REF_3])
    assert_equal create(:product, reference: 'REF_0', category: 'CAT_0').destination, destn_one
    assert_equal create(:product, reference: 'REF_2', category: 'CAT_2').destination, destn_one
    assert_equal create(:product, reference: 'REF_3', category: 'CAT_3').destination, destn_two
    assert_equal create(:product, reference: 'REF_3', category: 'CAT_0').destination, destn_one
  end
end
