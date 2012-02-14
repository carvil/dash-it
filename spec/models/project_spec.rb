require 'spec_helper'

describe Project do
  context "given a valid set of attributes" do
    it "should save the project" do
      project = FactoryGirl.build(:project)
      project.valid?.should be_true
      project.save.should be_true
    end
  end

  context "given invalid attributes" do
    it "should not save the project" do
      project = Project.new
      project.valid?.should be_false
      project.save.should be_false
    end
  end
end
