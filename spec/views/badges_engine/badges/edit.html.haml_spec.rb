require 'spec_helper'

describe "badges_engine/badges/edit.html.haml" do
  before(:each) do
    @badge = assign(:badge, stub_model(BadgesEngine::Badge,
      :version => "MyString",
      :name => "MyString",
      :image => "MyString",
      :description => "MyString",
      :criteria => "MyString"
    ))
  end

  it "renders the edit badge form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => badges_path(@badge), :method => "post" do
      assert_select "input#badge_name", :name => "badge[name]"
      assert_select "input#badge_image", :name => "badge[image]"
      assert_select "input#badge_description", :name => "badge[description]"
      assert_select "input#badge_criteria", :name => "badge[criteria]"
    end
  end
end
