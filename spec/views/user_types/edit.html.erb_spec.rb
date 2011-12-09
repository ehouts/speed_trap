require 'spec_helper'

describe "user_types/edit.html.erb" do
  before(:each) do
    @user_type = assign(:user_type, stub_model(UserType,
      :name => "MyString",
      :user_level => 1
    ))
  end

  it "renders the edit user_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => user_types_path(@user_type), :method => "post" do
      assert_select "input#user_type_name", :name => "user_type[name]"
      assert_select "input#user_type_user_level", :name => "user_type[user_level]"
    end
  end
end
