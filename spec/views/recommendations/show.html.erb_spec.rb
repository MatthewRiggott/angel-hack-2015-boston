require 'rails_helper'

RSpec.describe "recommendations/show", type: :view do
  before(:each) do
    @recommendation = assign(:recommendation, Recommendation.create!(
      :location => "Location",
      :user_id => 1,
      :details => "Details",
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Location/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Details/)
    expect(rendered).to match(/Title/)
  end
end
