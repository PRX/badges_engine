require 'spec_helper'

describe "badges_engine/assertions/edit.html.haml" do
  before(:each) do
    @assertion = assign(:assertion, stub_model(BadgesEngine::Assertion,
      :user_id => 1,
      :badge_id => 1,
      :evidence => "evidence"
    ))
  end

  it "renders the edit assertion form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => assertions_path(@assertion), :method => "post" do
      assert_select "input#assertion_user_id", :name => "assertion[user_id]"
      assert_select "input#assertion_badge_id", :name => "assertion[badge_id]"
      assert_select "input#assertion_evidence", :name => "assertion[evidence]"
    end
  end
end
