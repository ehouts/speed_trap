require 'spec_helper'

describe "entrants/index.html.erb" do
  before(:each) do
    assign(:entrants, [
      stub_model(Entrant,
        :name => "Name",
        :email => "Email",
        :phone => "Phone",
        :number => "Number",
        :vehicle_class_id => 1,
        :vehicle_make => "Vehicle Make",
        :vehicle_model => "Vehicle Model",
        :vehicle_color => "Vehicle Color"
      ),
      stub_model(Entrant,
        :name => "Name",
        :email => "Email",
        :phone => "Phone",
        :number => "Number",
        :vehicle_class_id => 1,
        :vehicle_make => "Vehicle Make",
        :vehicle_model => "Vehicle Model",
        :vehicle_color => "Vehicle Color"
      )
    ])
  end

  it "renders a list of entrants" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Vehicle Make".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Vehicle Model".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Vehicle Color".to_s, :count => 2
  end
end
