ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors, with: :threads)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Helper method to check for decorated fields in the response
    def assert_decorated_fields_in_response(json_response)
      %w[formatted_title formatted_author formatted_description formatted_genre formatted_pages formatted_price formatted_rating].each do |key|
        assert json_response.key?(key), "Expected JSON response to include #{key}"
      end
    end
  end
end
