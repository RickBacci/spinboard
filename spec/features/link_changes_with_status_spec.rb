require 'rails_helper'

RSpec.feature "Link", type: :feature, js:true do

  it 'changes with status' do
    user = User.create!(email: 'user@email.com', password: 'password')
    link = user.links.create(title: 'Google', url: 'http://www.google.com')

    visit links_path

    click_link_or_button "Login"
    fill_in "Email", with: 'user@email.com'
    fill_in 'Password', with: 'password'
    click_link_or_button "Login"

    # expect color


    click_link_or_button "Mark as Read"

    expect(page).to have_css('tr.false')
  end
end
