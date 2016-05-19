require 'rails_helper'

RSpec.describe Artist, type: :model do

  it "has a valid factory" do
    expect(FactoryGirl.build(:artist)).to be_valid
  end

  it "is invalid without a name" do
    expect(FactoryGirl.build(:artist, name: nil)).not_to be_valid
  end

  it "is invalid without a user" do
    expect(FactoryGirl.build(:artist, user: nil)).not_to be_valid
  end

  describe "uniqueness" do
    let(:artist){ FactoryGirl.create(:artist) }
  
    
    specify {expect(FactoryGirl.build(:artist, name:artist.name)).to be_valid }
    specify {expect(FactoryGirl.build(:artist, user: artist.user, name:artist.name)).not_to be_valid }
    specify {expect(FactoryGirl.build(:artist, user: artist.user, name:artist.name+"second")).to be_valid }

  end


end
