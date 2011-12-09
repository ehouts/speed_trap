require 'spec_helper'

describe "stations/new.html.erb" do
  before(:each) do
    assign(:station, stub_model(Station,
      :event_id => 1,
      :name => "MyString",
      :trap_1_name => "MyString",
      :trap_2_name => "MyString",
      :trap_3_name => "MyString",
      :trap_4_name => "MyString"
    ).as_new_record)
  end

  it "renders new station form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => stations_path, :method => "post" do
      assert_select "input#station_event_id", :name => "station[event_id]"
      assert_select "input#station_name", :name => "station[name]"
      assert_select "input#station_trap_1_name", :name => "station[trap_1_name]"
      assert_select "input#station_trap_2_name", :name => "station[trap_2_name]"
      assert_select "input#station_trap_3_name", :name => "station[trap_3_name]"
      assert_select "input#station_trap_4_name", :name => "station[trap_4_name]"
    end
  end
end
