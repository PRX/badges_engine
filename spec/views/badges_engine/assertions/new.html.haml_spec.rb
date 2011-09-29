require 'spec_helper'

describe "badges_engine/assertions/new.html.haml" do
  before(:each) do
    assign(:assertion, stub_model(BadgesEngine::Assertion,
      :user_id => 1,
      :badge_id => 1,
      :evidence => "MyString"
    ).as_new_record)
  end

  it "renders new assertion form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => assertions_path, :method => "post" do
      assert_select "input#assertion_user_id", :name => "assertion[user_id]"
      assert_select "input#assertion_badge_id", :name => "assertion[badge_id]"
      assert_select "input#assertion_evidence", :name => "assertion[evidence]"
    end
  end
end
