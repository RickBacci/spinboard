require 'test_helper'

class UserCreatesAccountTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "user can create a new account" do

    visit links_path

    click_link "Sign Up"
    fill_in "Email", with: 'user@email.com'
    fill_in 'Password', with: 'password'
    fill_in 'Confirmation', with: 'password'
    click_link_or_button "Create Account"

    assert page.has_content?("user@email.com")
  end
end
