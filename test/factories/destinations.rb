# frozen_string_literal: true

# == Schema Information
#
# Table name: destinations
#
#  id         :bigint           not null, primary key
#  categories :text             default([]), is an Array
#  name       :string
#  references :text             default([]), is an Array
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :destination do
    name do
      loop do
        name = FFaker::Address.city
        break name unless Destination.exists?(name: name)
      end
    end
    categories { Constants::CATEGORIES.sample(3) }
    references { Constants::REFERENCES.sample(3) }
  end
end
