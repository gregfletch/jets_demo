# frozen_string_literal: true

# Configure sensitive parameters which will be filtered from the log file.
Jets.application.configure do
  config.controllers.filtered_parameters += %i[_key certificate credit_card crypt email first_name last_name otp passw salt secret ssn token]
end
