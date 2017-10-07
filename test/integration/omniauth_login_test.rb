require 'test_helper'

class OmniauthLoginTest < ActionDispatch::IntegrationTest
  def login_and_logout_fb
    click_on 'Sign in with Facebook'
    assert page.has_text?('Successfully authenticated from Facebook account.')
    click_on 'Logout'
    assert page.has_text?('Signed out successfully.')
  end

  def login_and_logout_github
    click_on 'Sign in with GitHub'
    assert page.has_text?('Successfully authenticated from GitHub account.')
    click_on 'Logout'
    assert page.has_text?('Signed out successfully.')
  end

  def login_and_logout_google
    click_on 'Sign in with Google'
    assert page.has_text?('Successfully authenticated from Google account.')
    click_on 'Logout'
    assert page.has_text?('Signed out successfully.')
  end

  def login_and_logout_twitter
    click_on 'Sign in with Twitter'
    assert page.has_text?('Successfully authenticated from Twitter account.')
    click_on 'Logout'
    assert page.has_text?('Signed out successfully.')
  end

  test 'Can login with Facebook credentials' do
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
      provider: 'facebook', uid: '100001', confirmed_at: Time.now,
      info: { last_name: 'Zuckerberg', first_name: 'Mark',
              email: 'mzuckerberg@facebook.com' }
    )
    # From home page
    visit root_path
    login_and_logout_fb

    # From user login page
    visit root_path
    click_on 'Login'
    login_and_logout_fb
  end

  test 'Can login with GitHub credentials' do
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(
      provider: 'github', uid: '100002', confirmed_at: Time.now,
      info: { last_name: 'Wanstrath', first_name: 'Chris',
              email: 'cwanstrath@github.com' }
    )
    # From home page
    visit root_path
    login_and_logout_github

    # From user login page
    visit root_path
    click_on 'Login'
    login_and_logout_github
  end

  test 'Can login with Google credentials' do
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
      provider: 'google_oauth2', uid: '100003', confirmed_at: Time.now,
      info: { last_name: 'Brin', first_name: 'Sergey',
              email: 'sbrin@gmail.com' }
    )
    # From home page
    visit root_path
    login_and_logout_google

    # From user login page
    visit root_path
    click_on 'Login'
    login_and_logout_google
  end

  test 'Can login with Twitter credentials' do
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new(
      provider: 'twitter', uid: '100004', confirmed_at: Time.now,
      info: { last_name: 'Dorsey', first_name: 'Jack',
              email: 'jdorsey@twitter.com' }
    )
    # From home page
    visit root_path
    login_and_logout_twitter

    # From user login page
    visit root_path
    click_on 'Login'
    login_and_logout_twitter
  end
end
