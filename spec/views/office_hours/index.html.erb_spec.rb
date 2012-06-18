require 'spec_helper'

describe "office_hours/index" do
  before(:each) do
    assign(:office_hours, [
      stub_model(OfficeHour,
        :name => "Name",
        :is_free => false,
        :input_tolerance => 1,
        :output_tolerance => 2
      ),
      stub_model(OfficeHour,
        :name => "Name",
        :is_free => false,
        :input_tolerance => 1,
        :output_tolerance => 2
      )
    ])
  end

  it "renders a list of office_hours" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
