require 'spec_helper'

describe "campuses/show" do
  before(:each) do
    @campus = assign(:campus, stub_model(Campus,
      :name => "Name",
      :short_name => "Short Name",
      :slug => "Slug",
      :user => nil,
      :event => nil,
      :group => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Short Name/)
    rendered.should match(/Slug/)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
  end
end
