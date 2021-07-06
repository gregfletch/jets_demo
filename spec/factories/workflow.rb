# frozen_string_literal: true

FactoryBot.define do
  factory :workflow do
    name { Faker::Hacker.noun }
    id { Workflow.generate_id }
    created_at { Time.now.utc.to_s }
    updated_at { Time.now.utc.to_s }
  end
end
