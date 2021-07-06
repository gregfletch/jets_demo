# frozen_string_literal: true

class Workflow < ApplicationItem
  include Identifiable

  column :id, :name, :created_at, :updated_at

  def self.prefix
    'w_'
  end

  validates :id, presence: true, id: true
  validates :name, presence: true, name: true
end
