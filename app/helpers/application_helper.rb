# frozen_string_literal: true

# Application general view helper
module ApplicationHelper
  def active_page?(path:)
    return 'active' if current_page?(path)
  end
end
