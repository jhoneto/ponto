require 'spec_helper'

describe Role do
  context "validations" do
    it "description require" do
    	role = Role.new
    	role.description = nil
    	role.should_not be_valid
    end
  end
end
