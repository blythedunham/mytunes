require 'rails_helper'

RSpec.describe "songs/edit", type: :view do
  before(:each) do
    @song = assign(:song, Song.create!(
      :name => "MyString",
      :length => 1,
      :album_id => nil,
      :user_id => nil
    ))
  end

  it "renders the edit song form" do
    render

    assert_select "form[action=?][method=?]", song_path(@song), "post" do

      assert_select "input#song_name[name=?]", "song[name]"

      assert_select "input#song_length[name=?]", "song[length]"

      assert_select "input#song_album_id_id[name=?]", "song[album_id_id]"

      assert_select "input#song_user_id_id[name=?]", "song[user_id_id]"
    end
  end
end
