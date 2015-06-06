require 'rails_helper'

RSpec.describe "recommendations/new", type: :view do
  before(:each) do
    assign(:recommendation, Recommendation.new(
      :location => "MyString",
      :user_id => 1,
      :details => "MyString",
      :title => "MyString"
    ))
  end

  it "renders new recommendation form" do
    render

    assert_select "form[action=?][method=?]", recommendations_path, "post" do

      assert_select "input#recommendation_location[name=?]", "recommendation[location]"

      assert_select "input#recommendation_user_id[name=?]", "recommendation[user_id]"

      assert_select "input#recommendation_details[name=?]", "recommendation[details]"

      assert_select "input#recommendation_title[name=?]", "recommendation[title]"
    end
  end
end
