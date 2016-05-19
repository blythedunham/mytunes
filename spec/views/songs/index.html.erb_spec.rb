require 'rails_helper'

RSpec.describe "songs/index", type: :view do
  before(:each) do
    assign(:songs, [
      Song.create!(
        :name => "Name",
        :length => 1,
        :album_id => nil,
        :user_id => nil
      ),
      Song.create!(
        :name => "Name",
        :length => 1,
        :album_id => nil,
        :user_id => nil
      )
    ])
  end

  it "renders a list of songs" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
