require 'spec_helper'

describe User do
  it 'needs a password and confirmation to save' do
    user = User.new(name: 'steve')
    
    user.save
    expect(user).to_not be_valid
    
    user.password = 'password'
    user.password_confirmation = ''
    user.save
    expect(user).to_not be_valid
    
    user.password_confirmation = 'password'
    user.save
    expect(user).to be_valid
  end
  
  it 'needs password and confirmation to match' do
    user = User.create(
      name: 'steve',
      password: 'hunter',
      password_confirmation: 'hunter2'
    )
    expect(user).to_not be_valid
  end
end

describe 'authentication' do
  let(:user) { User.create(name: 'steve', password: 'hunter2', password_confirmation: 'hunter2')}
  
  it 'authenticates with a correct password' do
    expect(user.authenticate('hunter2')).to be
  end
  
  it 'does not authenticate with an incorrect password' do
    expect(user.authenticate('hunter1')).to_not be
  end
end
