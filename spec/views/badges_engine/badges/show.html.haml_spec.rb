require 'spec_helper'

describe "badges_engine/badges/show.html.haml" do
  before(:each) do
    @badge = assign(:badge, stub_model(BadgesEngine::Badge,
      :version => "Version",
      :name => "Name",
      :image => "Image",
      :description => "Description",
      :criteria => "Criteria"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Image/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Criteria/)
  end
end
