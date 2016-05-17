require 'test_helper'

describe Food do
  it "uses v2 of the API" do
    assert_equal "http://......", FOOD::BASE_URL
  end

  describe "API" do
    before do
      @instancevariable = Food.find(12)
  end

  it "knows its name", :vcr do
    assert_equal "instancevariable", @instancevariable.name
  end
end 






#_____________________________________
# to run in terminal use:
# rake test
