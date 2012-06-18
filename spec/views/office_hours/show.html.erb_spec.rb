require 'spec_helper'

describe "office_hours/show" do
  before(:each) do
    @office_hour = assign(:office_hour, stub_model(OfficeHour,
      :name => "Name",
      :is_free => false,
      :input_tolerance => 1,
      :output_tolerance => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/false/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
