require 'spec_helper'

describe "justifications/index" do
  before(:each) do
    assign(:justifications, [
      stub_model(Justification,
        :employee_id => 1,
        :description => "Description"
      ),
      stub_model(Justification,
        :employee_id => 1,
        :description => "Description"
      )
    ])
  end

  it "renders a list of justifications" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
