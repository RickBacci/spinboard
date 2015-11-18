require 'rails_helper'

RSpec.describe User, type: :model do

  it 'has an email' do
    user = User.create(email: 'test@email.com', password: 'password')

    expect(user)

    user.email = ''

    expect(user.save).to be_falsey
  end


  it 'has a valid email' do
    user = User.create(email: 'test@email.com', password: 'password')

    expect(user)

    user.email = 'testemail.com'

    expect(user.save).to be_falsey
  end
end

