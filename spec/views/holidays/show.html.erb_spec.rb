require 'spec_helper'

describe "holidays/show" do
  before(:each) do
    @holiday = assign(:holiday, stub_model(Holiday,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
