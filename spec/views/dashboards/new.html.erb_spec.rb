require 'rails_helper'

RSpec.describe "dashboards/new", type: :view do
  before(:each) do
    assign(:dashboard, build(:dashboard))
  end

  it "renders new dashboard form" do
    render

    assert_select "form[action=?][method=?]", dashboards_path, "post" do
    end
  end
end
