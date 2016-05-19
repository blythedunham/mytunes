require 'rails_helper'

RSpec.describe Album, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:album)).to be_valid
  end

  it "is invalid without a name" do
    expect(FactoryGirl.build(:album, name: nil)).not_to be_valid
  end

  it "is invalid without a user" do
    expect(FactoryGirl.build(:album, user: nil)).not_to be_valid
  end

  it "is invalid without an album" do
    expect(FactoryGirl.build(:album, artist: nil)).not_to be_valid
  end

  describe "uniqueness" do
    let(:album){ FactoryGirl.create(:album) }
    specify {expect(FactoryGirl.build(:album, name:album.name)).to be_valid }
    specify {expect(FactoryGirl.build(:album, artist: album.artist, name:album.name)).not_to be_valid }
    specify {expect(FactoryGirl.build(:album, artist: album.artist, name:album.name+"second")).to be_valid }
  end
end
