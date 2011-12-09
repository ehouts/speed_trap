require 'spec_helper'

describe "system_settings/index.html.erb" do
  before(:each) do
    assign(:system_settings, [
      stub_model(SystemSetting,
        :event_id => 1,
        :min_time_diff => 1,
        :break_time => 1
      ),
      stub_model(SystemSetting,
        :event_id => 1,
        :min_time_diff => 1,
        :break_time => 1
      )
    ])
  end

  it "renders a list of system_settings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
