require 'spec_helper'

describe "entrants/show.html.erb" do
  before(:each) do
    @entrant = assign(:entrant, stub_model(Entrant,
      :name => "Name",
      :email => "Email",
      :phone => "Phone",
      :number => "Number",
      :vehicle_class_id => 1,
      :vehicle_make => "Vehicle Make",
      :vehicle_model => "Vehicle Model",
      :vehicle_color => "Vehicle Color"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Phone/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Number/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Vehicle Make/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Vehicle Model/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Vehicle Color/)
  end
end
