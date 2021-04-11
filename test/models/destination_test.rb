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
require 'test_helper'

class DestinationTest < ActiveSupport::TestCase
  context 'associations' do
    should have_many(:products).dependent(:nullify)
  end

  context 'validations' do
    should validate_uniqueness_of(:name)
  end
end
