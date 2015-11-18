require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "user can login" do

    user = User.create(email: 'test@email.com',
                       password: 'password')

    visit new_session_path

    fill_in "Email", with: "test@email.com"
    fill_in "Password", with: "password"

    click_button "Login"

    assert page.has_content?("Welcome, test@email.com!")
  end
end
