require 'spec_helper'

describe "stations/index.html.erb" do
  before(:each) do
    assign(:stations, [
      stub_model(Station,
        :event_id => 1,
        :name => "Name",
        :trap_1_name => "Trap 1 Name",
        :trap_2_name => "Trap 2 Name",
        :trap_3_name => "Trap 3 Name",
        :trap_4_name => "Trap 4 Name"
      ),
      stub_model(Station,
        :event_id => 1,
        :name => "Name",
        :trap_1_name => "Trap 1 Name",
        :trap_2_name => "Trap 2 Name",
        :trap_3_name => "Trap 3 Name",
        :trap_4_name => "Trap 4 Name"
      )
    ])
  end

  it "renders a list of stations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Trap 1 Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Trap 2 Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Trap 3 Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Trap 4 Name".to_s, :count => 2
  end
end
