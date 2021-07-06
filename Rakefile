# frozen_string_literal: true

require 'jets'
Jets.load_tasks

if Jets.env == 'development'
  require 'rubocop_runner/rake_task'
  RubocopRunner::RakeTask.new
end
