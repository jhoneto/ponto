require 'spec_helper'

describe "enterprises/edit" do
  before(:each) do
    @enterprise = assign(:enterprise, stub_model(Enterprise))
  end

  it "renders the edit enterprise form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => enterprises_path(@enterprise), :method => "post" do
    end
  end
end
