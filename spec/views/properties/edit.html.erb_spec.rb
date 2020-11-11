require 'rails_helper'

RSpec.describe "properties/edit", type: :view do
  before(:each) do
    @property = assign(:property, Property.create!(
      property_name: "MyText",
      rent: 1,
      address: "MyText",
      age: 1,
      remarks: "MyString"
    ))
  end

  it "renders the edit property form" do
    render

    assert_select "form[action=?][method=?]", property_path(@property), "post" do

      assert_select "textarea[name=?]", "property[property_name]"

      assert_select "input[name=?]", "property[rent]"

      assert_select "textarea[name=?]", "property[address]"

      assert_select "input[name=?]", "property[age]"

      assert_select "input[name=?]", "property[remarks]"
    end
  end
end
