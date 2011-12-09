require 'spec_helper'

describe "trap_speeds/show.html.erb" do
  before(:each) do
    @trap_speed = assign(:trap_speed, stub_model(TrapSpeed,
      :event_id => 1,
      :station_id => 1,
      :entrant_id => 1,
      :official_flag => "",
      :trap_number => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
