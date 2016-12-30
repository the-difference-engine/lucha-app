module ControllerHelpers
  def login_with(user = double('user'), scope = :user)
    current_user = "current_#{scope}".to_sym
    if user.nil?
      allow(request.env['warden']).to receive(:authenticate!).and_throw(:warden, {:scope => scope})
      allow(controller).to receive(current_user).and_return(nil)
    else
      allow(request.env['warden']).to receive(:authenticate!).and_return(user)
      allow(controller).to receive(current_user).and_return(user)
    end
  end

  def login_with_client(user = double('user'), scope = :user)
    current_client = "current_#{scope}".to_sym
    if user.nil?
      allow(request.env['warden']).to receive(:authenticate!).and_throw(:warden, {:scope => scope})
      allow(controller).to receive(current_client).and_return(nil)
    else
      allow(request.env['warden']).to receive(:authenticate!).and_return(user)
      allow(controller).to receive(current_client).and_return(user)
    end
  end

## login_user will give us current_user in the rspec scope
## login_client will give us current_client in the rspec scope
## the above two methods really don't help us. all they do is create a double with no info, not helpful but I have no idea what depends on these methods so until you have gone through all the tests and refactored I wouldn't delete these.
  def login_user
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      #user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
      sign_in user
  end

  def login_client
    @request.env["devise.mapping"] = Devise.mappings[:client]
    client = FactoryGirl.create(:client)
    #user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
    sign_in client
  end
end

