require 'spec_helper'

describe "office_hours/edit" do
  before(:each) do
    @office_hour = assign(:office_hour, stub_model(OfficeHour,
      :name => "MyString",
      :is_free => false,
      :input_tolerance => 1,
      :output_tolerance => 1
    ))
  end

  it "renders the edit office_hour form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => office_hours_path(@office_hour), :method => "post" do
      assert_select "input#office_hour_name", :name => "office_hour[name]"
      assert_select "input#office_hour_is_free", :name => "office_hour[is_free]"
      assert_select "input#office_hour_input_tolerance", :name => "office_hour[input_tolerance]"
      assert_select "input#office_hour_output_tolerance", :name => "office_hour[output_tolerance]"
    end
  end
end
