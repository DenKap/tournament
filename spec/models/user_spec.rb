require 'rails_helper'

RSpec.describe User, type: :model do
  it 'creates or updates itself from an oauth hash' do
    OmniAuth.config.test_mode = true
    auth = OmniAuth.config.mock_auth[:starladder] = OmniAuth::AuthHash.new({
      provider: 'starladder',
      uid: '123456',
      info: {
        email: 'utility@gmail.com',
        nick: 'nickname99'
      },
      credentials: {
        token: 'abcde12345',
        refresh_token: 'qwerty67890',
        expires_at: DateTime.now
      }
    })
    User.from_omniauth(auth)
    new_user = User.first

    expect(new_user.provider).to eq('starladder')
    expect(new_user.uid).to eq('123456'.to_i)
    expect(new_user.email).to eq('utility@gmail.com')
    expect(new_user.nick).to eq('nickname99')
    expect(new_user.token).to eq('abcde12345')
    expect(new_user.refresh_token).to eq('qwerty67890')
    expect(new_user.token_expires_at).to eq(auth[:credentials][:expires_at].to_i)
  end
end
