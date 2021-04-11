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
  validates :name, presence: true, uniqueness: true
end
