require 'test_helper'

class UserCreatesAccountTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "user can create a new account" do

    visit links_path

    click_link "Register"
    fill_in "Email", with: 'user@email.com'
    fill_in 'Password', with: 'password'
    fill_in 'Confirmation', with: 'password'
    click_button "Create Account"

    assert page.has_content?("Welcome, user@email.com!")
  end
end
