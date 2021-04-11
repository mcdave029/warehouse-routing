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
class Destination < ApplicationRecord
  has_many :products, dependent: :nullify

  validates :name, presence: true, uniqueness: true

  after_save :remap_products_destination

  private

  def remap_products_destination
    products.find_each(&:save)
  end
end
