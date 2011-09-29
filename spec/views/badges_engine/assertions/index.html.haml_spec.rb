require 'spec_helper'

describe "badges_engine/assertions/index.html.haml" do
  before(:each) do
    assign(:assertions, [
      stub_model(BadgesEngine::Assertion,
        :user_id => 1,
        :badge_id => 2,
        :evidence => "Evidence"
      ),
      stub_model(BadgesEngine::Assertion,
        :user_id => 1,
        :badge_id => 2,
        :evidence => "Evidence"
      )
    ])
  end

  it "renders a list of assertions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 2.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Evidence".to_s, :count => 2
  end
end
