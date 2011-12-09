require 'spec_helper'

describe "vehicle_classes/show.html.erb" do
  before(:each) do
    @vehicle_class = assign(:vehicle_class, stub_model(VehicleClass,
      :event_id => 1,
      :name => "Name",
      :max_speed => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
