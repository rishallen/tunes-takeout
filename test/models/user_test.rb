require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @known = OmniAuth.config.mock_auth[:spotify_known]
    @unknown = OmniAuth.config.mock_auth[:spotify_unknown]
  end

  # test "can find an exisiting user given an oauth spotify hash" do
  #   assert_equal
  # end
end
