require 'spec_helper'

describe "vehicle_classes/new.html.erb" do
  before(:each) do
    assign(:vehicle_class, stub_model(VehicleClass,
      :event_id => 1,
      :name => "MyString",
      :max_speed => 1
    ).as_new_record)
  end

  it "renders new vehicle_class form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => vehicle_classes_path, :method => "post" do
      assert_select "input#vehicle_class_event_id", :name => "vehicle_class[event_id]"
      assert_select "input#vehicle_class_name", :name => "vehicle_class[name]"
      assert_select "input#vehicle_class_max_speed", :name => "vehicle_class[max_speed]"
    end
  end
end
