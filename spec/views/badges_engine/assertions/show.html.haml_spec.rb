require 'spec_helper'

describe "badges_engine/assertions/show.html.haml" do
  before(:each) do
    @assertion = assign(:assertion, stub_model(BadgesEngine::Assertion,
      :user_id => 1,
      :badge_id => 2,
      :token => 'THISISATOKEN',
      :evidence => "Evidence"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/2/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Evidence/)
  end
end
