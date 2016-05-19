require 'rails_helper'

RSpec.describe Song, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:song)).to be_valid
  end

  it "is invalid without a name" do
    expect(FactoryGirl.build(:song, name: nil)).not_to be_valid
  end

  it "is invalid without a user" do
    expect(FactoryGirl.build(:song, user: nil)).not_to be_valid
  end

  it "is invalid without an album" do
    expect(FactoryGirl.build(:song, album: nil)).not_to be_valid
  end

  describe "uniqueness" do
    let(:song){ FactoryGirl.create(:song) }
    specify {expect(FactoryGirl.build(:song, name:song.name)).to be_valid }
    specify {expect(FactoryGirl.build(:song, album: song.album, name:song.name)).not_to be_valid }
    specify {expect(FactoryGirl.build(:song, album: song.album, name:song.name+"second")).to be_valid }

  end
end
