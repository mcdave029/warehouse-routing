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
class Product < ApplicationRecord
  belongs_to :destination, optional: true

  validates :name, uniqueness: true
  validates :name, :price, :reference, :category, presence: true
  validates :reference, inclusion: { in: Constants::REFERENCES }
  validates :category, inclusion: { in: Constants::CATEGORIES }

  after_validation :route_destination

  private

  def route_destination
    destn = Destination.find_by(sql_query(strict: true), category: category, reference: reference)
    destn = Destination.find_by(sql_query(strict: false), category: category, reference: reference) if destn.blank?
    self.destination_id = destn&.id
  end

  def sql_query(strict:)
    ":reference = ANY (destinations.references) #{strict ? 'AND' : 'OR'}"\
    ' :category = ANY (destinations.categories)'
  end
end
