class InformationController < ApplicationController
  # @!group Exposures

  # @!attribute plans
  # All the plans that are available.
  # @return [Relation<Plan>]
  expose(:plans) { Plan.order(:price) }

  # @!group Actions

  # This action displays all the plans and pricing.
  #
  # @render pricing
  # @return [Action]
  def pricing
  end
end