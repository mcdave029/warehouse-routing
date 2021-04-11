# frozen_string_literal: true

# Controller for Destinations table
class DestinationsController < ApplicationController
  before_action :set_destination, only: %i[update destroy]

  # GET /destinations or /destinations.json
  def index
    @destination = Destination.new
    set_destinations
  end

  # POST /destinations or /destinations.json
  def create
    @destination = Destination.new(destination_params)
    @destination.save
    set_destinations
  end

  # PATCH/PUT /destinations/1 or /destinations/1.json
  def update
    @destination.update(destination_params)
    set_destinations
  end

  # DELETE /destinations/1 or /destinations/1.json
  def destroy
    @destination.destroy
    set_destinations
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_destination
    @destination = Destination.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def destination_params
    params.require(:destination)
          .permit(:name, categories: [], references: [])
          .tap do |permitted_params|
      permitted_params[:references] = permitted_params[:references].reject(&:blank?)
      permitted_params[:categories] = permitted_params[:categories].reject(&:blank?)
    end
  end

  def set_destinations
    @destinations = Destination.all.order(created_at: :desc)
  end
end
