require 'rails_helper'

RSpec.describe "recommendations/edit", type: :view do
  before(:each) do
    @recommendation = assign(:recommendation, Recommendation.create!(
      :location => "MyString",
      :user_id => 1,
      :details => "MyString",
      :title => "MyString"
    ))
  end

  it "renders the edit recommendation form" do
    render

    assert_select "form[action=?][method=?]", recommendation_path(@recommendation), "post" do

      assert_select "input#recommendation_location[name=?]", "recommendation[location]"

      assert_select "input#recommendation_user_id[name=?]", "recommendation[user_id]"

      assert_select "input#recommendation_details[name=?]", "recommendation[details]"

      assert_select "input#recommendation_title[name=?]", "recommendation[title]"
    end
  end
end
