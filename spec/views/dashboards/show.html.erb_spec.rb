require 'rails_helper'

RSpec.describe "dashboards/show", type: :view do
  before(:each) do
    assign(:dashboard, create(:dashboard))
  end

  it "renders the dashboard" do
    render
  end
end
