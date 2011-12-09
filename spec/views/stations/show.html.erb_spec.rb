require 'spec_helper'

describe "stations/show.html.erb" do
  before(:each) do
    @station = assign(:station, stub_model(Station,
      :event_id => 1,
      :name => "Name",
      :trap_1_name => "Trap 1 Name",
      :trap_2_name => "Trap 2 Name",
      :trap_3_name => "Trap 3 Name",
      :trap_4_name => "Trap 4 Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Trap 1 Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Trap 2 Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Trap 3 Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Trap 4 Name/)
  end
end
