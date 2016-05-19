require 'rails_helper'

RSpec.describe "Artists", type: :request do
  describe "GET /artists" do
    it "#artist path" do
      #user = double('user')
      #allow(request.env['warden']).to receive(:authenticate!).and_return(user)
      #allow(controller).to receive(:current_user).and_return(user)

      sign_in create(:user, name: 'John Doe')

      get artists_path
      expect(response).to have_http_status(200)
    end
  end
end
