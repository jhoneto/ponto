require 'spec_helper'

describe "justifications/show" do
  before(:each) do
    @justification = assign(:justification, stub_model(Justification,
      :employee_id => 1,
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Description/)
  end
end
