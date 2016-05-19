require 'rails_helper'

RSpec.describe "Albums", type: :request do
  describe "GET /albums" do
    it "loads the albums path" do
      sign_in FactoryGirl.create(:user)
      get albums_path
      expect(response).to have_http_status(200)
    end
  end
end
