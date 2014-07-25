require 'spec_helper'

describe "campuses/edit" do
  before(:each) do
    @campus = assign(:campus, stub_model(Campus,
      :name => "MyString",
      :short_name => "MyString",
      :slug => "MyString",
      :user => nil,
      :event => nil,
      :group => nil
    ))
  end

  it "renders the edit campus form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", campus_path(@campus), "post" do
      assert_select "input#campus_name[name=?]", "campus[name]"
      assert_select "input#campus_short_name[name=?]", "campus[short_name]"
      assert_select "input#campus_slug[name=?]", "campus[slug]"
      assert_select "input#campus_user[name=?]", "campus[user]"
      assert_select "input#campus_event[name=?]", "campus[event]"
      assert_select "input#campus_group[name=?]", "campus[group]"
    end
  end
end
