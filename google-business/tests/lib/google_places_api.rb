require_relative "../../lib/google_places_api.rb"
require "test/unit"
require "shoulda"
require "mocha/setup"


class GooglePlacesAPITest < Test::Unit::TestCase

  should "require an api key to be supplied" do
    assert_raise ArgumentError do
      GooglePlacesAPI.new()
    end
  end

  should "set api key as a parameter" do
    example_key = "test_api_key"
    api = GooglePlacesAPI.new(example_key)
    assert_equal api.class.default_params[:key], example_key
  end

  context "autocomplete" do
    setup do
      @api = GooglePlacesAPI.new("example_key")
      @httparty_mock = mock('HTTParty')
    end

    should "call correct endpoint" do
      result = @api.class.expects(:get).returns("example json").once
      @api.autocomplete(:query => { :input => "example text" })
    end
  end

end