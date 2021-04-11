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
FactoryBot.define do
  factory :product do
    name do
      loop do
        name = FFaker::Product.product_name
        break name unless Product.exists?(name: name)
      end
    end
    price { 59 }
    reference { Constants::REFERENCES.sample }
    category { Constants::CATEGORIES.sample }
  end
end
