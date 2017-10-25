require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryGirl.build_stubbed(:user)
  end

  describe 'creation' do
    it 'can be created' do
      expect(@user).to be_valid
    end
  end

  describe 'validations' do
    it 'can not be created if not valid' do
      @user.first_name = nil
      @user.last_name = nil
      @user.email = nil
      @user.password
      expect(@user).to_not be_valid
    end

    it 'has a unique email' do
      first_user = User.create(first_name: 'User',
                                 last_name: 'Bla',
                                 email: 'user@mail.com',
                                 password: '123456789')
      duplicate_user = User.create(first_name: 'User',
                                 last_name: 'Bla',
                                 email: 'user@mail.com',
                                 password: '123456789')
      expect(duplicate_user).to_not be_valid
    end
  end
end
