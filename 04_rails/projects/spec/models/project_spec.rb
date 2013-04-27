require 'spec_helper'

describe Project do
  it "has a string value for a status" do
    p = Project.new(:status => 1)
    p.status_as_string.should == "Open"
  end
end
