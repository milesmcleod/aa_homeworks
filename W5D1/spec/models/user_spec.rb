require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:user) do
    User.new(
      email: '123',
      password: 'password',
      session_token: 'vaskjdngaosdkf',
      activated: false,
      activation_token: '123456',
      admin: false
    )
  end

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should validate_length_of(:password).is_at_least(6) }

  describe '#valid_password?' do
    it 'returns true with valid password' do
      expect(user.valid_password?('password')).to be true
    end

    it 'returns false with invalid password' do
      expect(user.valid_password?('brangus')).to be false
    end
  end


  describe '#reset_session_token!' do
    it 'generates a new session token' do
      user.session_token = 'abc'
      user.reset_session_token!
      expect(user.session_token).not_to eq('abc')
    end

    it 'saves the user to the database' do
      expect(user).to receive(:save!)
      user.reset_session_token!
    end

    it 'returns the new token' do
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end



  describe '::find_by_credentials' do
    context 'with valid login credentials' do
      it 'returns the correct user' do
        user.save!
        expect(User.find_by_credentials('123', 'password')).to eq(user)
      end
    end
    context 'with invalid login credentials' do
      it 'returns nil' do
        user.save!
        expect(User.find_by_credentials('123', 'beans')).to be nil
      end
    end
  end


end
