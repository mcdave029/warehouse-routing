# frozen_string_literal: true

# Store all constant values used in the app
class Constants
  CATEGORIES = 10.times.map { |int| "CAT_#{int}" }
  REFERENCES = 10.times.map { |int| "REF_#{int}" }
end
