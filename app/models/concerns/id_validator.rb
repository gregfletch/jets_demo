# frozen_string_literal: true

class IdValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, 'contains invalid ID') unless id_valid?(record, value)
  end

  private

  def id_valid?(record, value)
    # Matches the model ID prefix followed by 16 random characters (a-zA-Z0-9)
    /^#{record.class.prefix}\w{16}$/.match?(value)
  end
end
