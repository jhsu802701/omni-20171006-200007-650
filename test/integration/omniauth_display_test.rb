require 'test_helper'

class OmniauthDisplayTest < ActionDispatch::IntegrationTest
  test "'GoogleOauth2' has been replaced with 'Google'" do
    visit root_path
    click_on 'Login'
    assert page.has_link?('Sign in with Google', href: user_google_oauth2_omniauth_authorize_path)
    assert_not page.has_link?('Sign in with GoogleOauth2', href: user_google_oauth2_omniauth_authorize_path)
  end

  test "Facebook user's home page and profile page show that Facebook was used to login" do
    create_omniauth_users
    visit root_path
    click_on 'Sign in with Facebook'
    click_on 'Home'
    assert page.has_text?('You logged in with Facebook.')
    click_on 'Your Profile'
    assert page.has_text?('OmniAuth Service Provider: Facebook')
    click_on 'Logout'
  end

  test "GitHub user's home page and profile page show that GitHub was used to login" do
    create_omniauth_users
    visit root_path
    click_on 'Sign in with GitHub'
    click_on 'Home'
    assert page.has_text?('You logged in with GitHub.')
    click_on 'Your Profile'
    assert page.has_text?('OmniAuth Service Provider: GitHub')
    click_on 'Logout'
  end

  test "Google user's home page and profile page show that Google was used to login" do
    create_omniauth_users
    visit root_path
    click_on 'Sign in with Google'
    click_on 'Home'
    assert page.has_text?('You logged in with Google.')
    click_on 'Your Profile'
    assert page.has_text?('OmniAuth Service Provider: Google')
    click_on 'Logout'
  end

  test 'The user index should show the OmniAuth Service provider' do
    create_omniauth_users
    login_as(@a1, scope: :admin)
    visit users_path
    assert page.has_text?('Provider')
    assert page.has_text?('Facebook')
    assert page.has_text?('GitHub')
    assert page.has_text?('Google')
  end
end
