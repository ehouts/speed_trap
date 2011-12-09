require 'spec_helper'

describe "user_types/new.html.erb" do
  before(:each) do
    assign(:user_type, stub_model(UserType,
      :name => "MyString",
      :user_level => 1
    ).as_new_record)
  end

  it "renders new user_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => user_types_path, :method => "post" do
      assert_select "input#user_type_name", :name => "user_type[name]"
      assert_select "input#user_type_user_level", :name => "user_type[user_level]"
    end
  end
end
