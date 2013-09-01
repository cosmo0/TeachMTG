require 'spec_helper'

describe "User model" do

  before do
    @user = User.new email: "john.doe@gmail.com",
                     password: "P4ssw0rD",
                     password_confirmation: "P4ssw0rD"
    # TODO: provider, uid, avatar (see what it looks like once a user has been added)
  end

  subject { @user }

  describe "when members exist" do
    it { should respond_to(:email) }
    it { should respond_to(:remember_me) }
    it { should respond_to(:password) }
  end

end
