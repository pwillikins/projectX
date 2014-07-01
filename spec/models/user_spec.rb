require 'spec_helper'

describe User do
  describe "Validations" do
    let(:user) { create_user }

    it 'can create a new user' do

      expect(user).to be_valid
    end
  end
end