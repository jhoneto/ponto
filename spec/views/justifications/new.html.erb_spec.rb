require 'spec_helper'

describe "justifications/new" do
  before(:each) do
    assign(:justification, stub_model(Justification,
      :employee_id => 1,
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new justification form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => justifications_path, :method => "post" do
      assert_select "input#justification_employee_id", :name => "justification[employee_id]"
      assert_select "input#justification_description", :name => "justification[description]"
    end
  end
end
