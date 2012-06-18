require 'spec_helper'

describe "OfficeHours" do
  describe "GET /office_hours" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get office_hours_path
      response.status.should be(200)
    end
  end
end
