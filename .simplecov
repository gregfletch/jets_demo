# frozen_string_literal: true

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
                                                                 SimpleCov::Formatter::HTMLFormatter
                                                               ])

unless ENV['NO_COVERAGE']
  SimpleCov.start do
    # track_files '{app,lib}/**/*.rb'
    coverage_dir 'coverage'
    enable_coverage :branch

    # add in custom groupings above and beyond the rails profile
    # add_group 'Exceptions', 'lib/exceptions'
    # add_group 'Policies', 'app/policies'
    # add_group 'Services', 'app/services'
  end
end
