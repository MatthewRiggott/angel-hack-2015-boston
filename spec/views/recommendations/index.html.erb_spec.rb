require 'rails_helper'

RSpec.describe "recommendations/index", type: :view do
  before(:each) do
    assign(:recommendations, [
      Recommendation.create!(
        :location => "Location",
        :user_id => 1,
        :details => "Details",
        :title => "Title"
      ),
      Recommendation.create!(
        :location => "Location",
        :user_id => 1,
        :details => "Details",
        :title => "Title"
      )
    ])
  end

  it "renders a list of recommendations" do
    render
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Details".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
