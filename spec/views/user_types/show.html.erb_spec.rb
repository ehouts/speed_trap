require 'spec_helper'

describe "user_types/show.html.erb" do
  before(:each) do
    @user_type = assign(:user_type, stub_model(UserType,
      :name => "Name",
      :user_level => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
