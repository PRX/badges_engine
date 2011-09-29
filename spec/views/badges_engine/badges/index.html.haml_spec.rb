require 'spec_helper'

describe "badges_engine/badges/index.html.haml" do
  before(:each) do
    assign(:badges, [
      stub_model(BadgesEngine::Badge,
        :version => "Version",
        :name => "Name",
        :image => "Image",
        :description => "Description",
        :criteria => "Criteria"
      ),
      stub_model(BadgesEngine::Badge,
        :version => "Version",
        :name => "Name",
        :image => "Image",
        :description => "Description",
        :criteria => "Criteria"
      )
    ])
  end

  it "renders a list of badges" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Criteria".to_s, :count => 2
  end
end
