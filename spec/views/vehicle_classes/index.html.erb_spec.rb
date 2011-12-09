require 'spec_helper'

describe "vehicle_classes/index.html.erb" do
  before(:each) do
    assign(:vehicle_classes, [
      stub_model(VehicleClass,
        :event_id => 1,
        :name => "Name",
        :max_speed => 1
      ),
      stub_model(VehicleClass,
        :event_id => 1,
        :name => "Name",
        :max_speed => 1
      )
    ])
  end

  it "renders a list of vehicle_classes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
