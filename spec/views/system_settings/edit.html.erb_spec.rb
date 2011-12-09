require 'spec_helper'

describe "system_settings/edit.html.erb" do
  before(:each) do
    @system_setting = assign(:system_setting, stub_model(SystemSetting,
      :event_id => 1,
      :min_time_diff => 1,
      :break_time => 1
    ))
  end

  it "renders the edit system_setting form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => system_settings_path(@system_setting), :method => "post" do
      assert_select "input#system_setting_event_id", :name => "system_setting[event_id]"
      assert_select "input#system_setting_min_time_diff", :name => "system_setting[min_time_diff]"
      assert_select "input#system_setting_break_time", :name => "system_setting[break_time]"
    end
  end
end
