require 'spec_helper'

describe "entrants/new.html.erb" do
  before(:each) do
    assign(:entrant, stub_model(Entrant,
      :name => "MyString",
      :email => "MyString",
      :phone => "MyString",
      :number => "MyString",
      :vehicle_class_id => 1,
      :vehicle_make => "MyString",
      :vehicle_model => "MyString",
      :vehicle_color => "MyString"
    ).as_new_record)
  end

  it "renders new entrant form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => entrants_path, :method => "post" do
      assert_select "input#entrant_name", :name => "entrant[name]"
      assert_select "input#entrant_email", :name => "entrant[email]"
      assert_select "input#entrant_phone", :name => "entrant[phone]"
      assert_select "input#entrant_number", :name => "entrant[number]"
      assert_select "input#entrant_vehicle_class_id", :name => "entrant[vehicle_class_id]"
      assert_select "input#entrant_vehicle_make", :name => "entrant[vehicle_make]"
      assert_select "input#entrant_vehicle_model", :name => "entrant[vehicle_model]"
      assert_select "input#entrant_vehicle_color", :name => "entrant[vehicle_color]"
    end
  end
end
