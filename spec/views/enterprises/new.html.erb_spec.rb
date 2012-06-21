require 'spec_helper'

describe "enterprises/new" do
  before(:each) do
    assign(:enterprise, stub_model(Enterprise).as_new_record)
  end

  it "renders new enterprise form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => enterprises_path, :method => "post" do
    end
  end
end
