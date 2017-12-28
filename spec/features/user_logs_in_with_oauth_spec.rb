require 'rails_helper'

RSpec.feature 'user logs in' do
  scenario 'using starladder oauth2' do
    stub_omniauth
    visit root_path
    expect(page).to have_link('Sign in')
    click_link 'Sign in'
    expect(page).to have_content('Signed in as nickname99')
    expect(page).to have_link('Logout')
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:starladder] = OmniAuth::AuthHash.new({
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
  end
end
