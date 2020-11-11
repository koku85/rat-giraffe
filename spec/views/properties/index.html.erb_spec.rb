require 'rails_helper'

RSpec.describe "properties/index", type: :view do
  before(:each) do
    assign(:properties, [
      Property.create!(
        property_name: "MyText",
        rent: 2,
        address: "MyText",
        age: 3,
        remarks: "Remarks"
      ),
      Property.create!(
        property_name: "MyText",
        rent: 2,
        address: "MyText",
        age: 3,
        remarks: "Remarks"
      )
    ])
  end

  it "renders a list of properties" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: "Remarks".to_s, count: 2
  end
end
