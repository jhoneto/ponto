require 'spec_helper'

describe "Enterprises" do
  describe "GET /enterprises" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get enterprises_path
      response.status.should be(200)
    end
  end
end