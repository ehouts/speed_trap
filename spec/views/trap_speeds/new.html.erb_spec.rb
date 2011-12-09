require 'spec_helper'

describe "trap_speeds/new.html.erb" do
  before(:each) do
    assign(:trap_speed, stub_model(TrapSpeed,
      :event_id => 1,
      :station_id => 1,
      :entrant_id => 1,
      :official_flag => "",
      :trap_number => 1
    ).as_new_record)
  end

  it "renders new trap_speed form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => trap_speeds_path, :method => "post" do
      assert_select "input#trap_speed_event_id", :name => "trap_speed[event_id]"
      assert_select "input#trap_speed_station_id", :name => "trap_speed[station_id]"
      assert_select "input#trap_speed_entrant_id", :name => "trap_speed[entrant_id]"
      assert_select "input#trap_speed_official_flag", :name => "trap_speed[official_flag]"
      assert_select "input#trap_speed_trap_number", :name => "trap_speed[trap_number]"
    end
  end
end
