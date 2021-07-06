# frozen_string_literal: true

require 'active_model'

class ApplicationItem < Dynomite::Item
  include ActiveModel::Validations
end
