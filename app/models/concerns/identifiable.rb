# frozen_string_literal: true

require 'active_support'

module Identifiable
  extend ActiveSupport::Concern

  class_methods do
    def generate_id
      "#{prefix}#{SecureRandom.base58(16)}"
    end
  end
end
