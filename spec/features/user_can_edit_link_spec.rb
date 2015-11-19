
require 'rails_helper'

RSpec.feature "User", type: :feature do

  let(:user) { User.create!(email: 'user@email.com', password: 'password') }

  before do
    visit links_path

    click_link_or_button "Login"
    fill_in "Email", with: 'user@email.com'
    fill_in 'Password', with: 'password'
    click_link_or_button "Login"
  end

  it 'can edit a link' do
    link = user.links.create(title: 'Google', url: 'http://www.google.com')
    expect(link).to be_valid

    click_link_or_button "Edit"
    fill_in "Title", with: 'Turing'
    fill_in 'Url', with: 'http://turing.io'
    click_link_or_button "Update"

  end

  it 'cannot be changed to an invalid url' do
    link = user.links.create!(title: 'Google', url: 'http://www.google.com')

    expect(link).to be_valid

    click_link_or_button "Edit"

    fill_in "Title", with: 'Turing'
    fill_in 'Url', with: 'ww.invalid.link'
    click_link_or_button "Update"

    expect(page).to have_content('There was a problem updating your link!')
  end
end
