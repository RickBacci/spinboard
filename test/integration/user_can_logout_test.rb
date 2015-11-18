require 'test_helper'

class UserLogoutTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "existing user can logout" do

    user = User.create(email: 'test@email.com',
                       password: 'password')

    visit new_session_path

    fill_in "Email", with: "test@email.com"
    fill_in "Password", with: "password"
    click_link_or_button "Login"

    assert page.has_content?("Welcome")

    click_link_or_button "Logout"

    refute page.has_content?("Welcome")
    reset_session!
  end
end
