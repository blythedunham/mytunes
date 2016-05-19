require 'rails_helper'

RSpec.describe "albums/edit", type: :view do
  before(:each) do
    @album = assign(:album, Album.create!(
      :name => "MyString",
      :artist => nil,
      :user => nil
    ))
  end

  it "renders the edit album form" do
    render

    assert_select "form[action=?][method=?]", album_path(@album), "post" do

      assert_select "input#album_name[name=?]", "album[name]"

      assert_select "input#album_artist_id[name=?]", "album[artist_id]"

      assert_select "input#album_user_id[name=?]", "album[user_id]"
    end
  end
end
