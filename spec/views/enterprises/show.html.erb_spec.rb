require 'spec_helper'

describe "enterprises/show" do
  before(:each) do
    @enterprise = assign(:enterprise, stub_model(Enterprise))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
