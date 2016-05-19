  # module ControllerHelpers
  #   def sign_in(user = double('user'))
  #     if user.nil?
  #       allow(request.env['warden']).to receive(:authenticate!).and_throw(:warden, {:scope => :user})
  #       allow(controller).to receive(:current_user).and_return(nil)
  #     else
  #       allow(request.env['warden']).to receive(:authenticate!).and_return(user)
  #       allow(controller).to receive(:current_user).and_return(user)
  #     end
  #   end
  # end

module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      sign_in FactoryGirl.create(:admin) # Using factory girl as an example
    end
  end

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @current_user = FactoryGirl.create(:user)
      sign_in @current_user
    end
  end
end
