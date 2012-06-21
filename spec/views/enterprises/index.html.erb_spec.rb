require 'spec_helper'

describe "enterprises/index" do
  before(:each) do
    assign(:enterprises, [
      stub_model(Enterprise),
      stub_model(Enterprise)
    ])
  end

  it "renders a list of enterprises" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
