require 'spec_helper'

describe "system_settings/show.html.erb" do
  before(:each) do
    @system_setting = assign(:system_setting, stub_model(SystemSetting,
      :event_id => 1,
      :min_time_diff => 1,
      :break_time => 1
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
  end
end
