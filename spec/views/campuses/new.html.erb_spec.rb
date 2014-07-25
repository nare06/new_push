require 'spec_helper'

describe "campuses/new" do
  before(:each) do
    assign(:campus, stub_model(Campus,
      :name => "MyString",
      :short_name => "MyString",
      :slug => "MyString",
      :user => nil,
      :event => nil,
      :group => nil
    ).as_new_record)
  end

  it "renders new campus form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", campuses_path, "post" do
      assert_select "input#campus_name[name=?]", "campus[name]"
      assert_select "input#campus_short_name[name=?]", "campus[short_name]"
      assert_select "input#campus_slug[name=?]", "campus[slug]"
      assert_select "input#campus_user[name=?]", "campus[user]"
      assert_select "input#campus_event[name=?]", "campus[event]"
      assert_select "input#campus_group[name=?]", "campus[group]"
    end
  end
end
