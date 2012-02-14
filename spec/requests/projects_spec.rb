require "spec_helper"

describe ProjectsController do
  
  before :each do
    @project = FactoryGirl.create(:project)
  end

  describe "#show" do
    context "given an existing project" do
      it "should return the project information" do

        get "/projects/#{@project.id}.json"

        response.status.should eq(200)
        body = JSON.parse(response.body)
        body.fetch("name").should eq(@project.name)
        body.fetch("id").should eq(@project.id)
      end
    end
  end

  describe "#index" do
    context "given a project exists" do
      it "should return a list with the project" do

        get "/projects.json"

        response.status.should eq(200)
        JSON.parse(response.body).size.should be(1)
      end
    end
  end

  describe "#create" do
    context "given a valid set of project attributes" do
      it "should create the project" do

        post "/projects.json", project: {name: "p1"}

        response.status.should eq(201)
        JSON.parse(response.body).fetch("name").should eq("p1")
      end
    end
  end

  describe "#update" do
    context "given an existing project" do
      it "should update the project" do
        Project.find(@project.id).name.should eq(@project.name)

        put "/projects/#{@project.id}.json", project: {name: "another_name"}

        Project.find(@project.id).name.should eq("another_name")
      end
    end
  end

  describe "#destroy" do
    context "given an existing user" do
      it "should delete the user" do
        Project.find(@project.id).should_not be_nil
        delete "/projects/#{@project.id}.json"
        Project.all.should eq([])
      end
    end
  end
end
