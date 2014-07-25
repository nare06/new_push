require 'spec_helper'

describe "campuses/index" do
  before(:each) do
    assign(:campuses, [
      stub_model(Campus,
        :name => "Name",
        :short_name => "Short Name",
        :slug => "Slug",
        :user => nil,
        :event => nil,
        :group => nil
      ),
      stub_model(Campus,
        :name => "Name",
        :short_name => "Short Name",
        :slug => "Slug",
        :user => nil,
        :event => nil,
        :group => nil
      )
    ])
  end

  it "renders a list of campuses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Short Name".to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
