# frozen_string_literal: true

require 'application_system_test_case'

class DestinationsTest < ApplicationSystemTestCase
  setup do
    create_list(:destination, 2)
    @destination = build(:destination)
  end

  test 'visiting the index' do
    visit destinations_url
    assert_selector 'h1', text: 'Destinations'
  end

  test 'creating a Destination' do
    visit destinations_url

    within('#new_destination') do
      fill_in id: 'destination_name', with: @destination.name
      select Constants::REFERENCES.sample, from: 'destination_references'
      select Constants::REFERENCES.sample, from: 'destination_references'
      select Constants::CATEGORIES.sample, from: 'destination_categories'
      select Constants::CATEGORIES.sample, from: 'destination_categories'
      click_on 'Create Destination'
    end

    assert_text 'Destination was successfully created'
  end

  test 'updating a Destination' do
    visit destinations_url
    click_on 'Edit', match: :first

    within('#edit_destination') do
      fill_in id: 'destination_name', with: @destination.name
      select Constants::REFERENCES.sample, from: 'edit_destination_references'
      select Constants::REFERENCES.sample, from: 'edit_destination_references'
      select Constants::CATEGORIES.sample, from: 'edit_destination_categories'
      select Constants::CATEGORIES.sample, from: 'edit_destination_categories'
      click_on 'Update Destination'
    end

    assert_text 'Destination was successfully updated'
  end

  test 'destroying a Destination' do
    visit destinations_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Destination was successfully destroyed'
  end
end
