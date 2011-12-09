require 'spec_helper'

describe "trap_speeds/index.html.erb" do
  before(:each) do
    assign(:trap_speeds, [
      stub_model(TrapSpeed,
        :event_id => 1,
        :station_id => 1,
        :entrant_id => 1,
        :official_flag => "",
        :trap_number => 1
      ),
      stub_model(TrapSpeed,
        :event_id => 1,
        :station_id => 1,
        :entrant_id => 1,
        :official_flag => "",
        :trap_number => 1
      )
    ])
  end

  it "renders a list of trap_speeds" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
