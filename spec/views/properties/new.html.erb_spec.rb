require 'rails_helper'

RSpec.describe "properties/new", type: :view do
  before(:each) do
    assign(:property, Property.new(
      property_name: "MyText",
      rent: 1,
      address: "MyText",
      age: 1,
      remarks: "MyString"
    ))
  end

  it "renders new property form" do
    render

    assert_select "form[action=?][method=?]", properties_path, "post" do

      assert_select "textarea[name=?]", "property[property_name]"

      assert_select "input[name=?]", "property[rent]"

      assert_select "textarea[name=?]", "property[address]"

      assert_select "input[name=?]", "property[age]"

      assert_select "input[name=?]", "property[remarks]"
    end
  end
end
