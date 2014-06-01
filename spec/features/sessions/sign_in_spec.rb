require 'spec_helper'

feature 'Signing in' do
  let(:user) { FactoryGirl.create(:user) }
  before do
    visit '/'
    click_link 'Sign in'
  end
  
  scenario 'Signing in via form' do
    fill_in 'Name', with: user.name
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    
    expect(page).to have_content('Signed in successfully.')
  end
  
  scenario 'Signing in email works too' do
    fill_in 'Name', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    
    expect(page).to have_content('Signed in successfully.')
  end
  
  scenario 'Signing in with wrong password' do
    fill_in 'Name', with: user.name
    fill_in 'Password', with: 'wrongpassword'
    click_button 'Sign in'
    
    expect(page).to have_content('Username or password is incorrect.')
  end
  
  scenario 'Signing in with wrong username' do
    fill_in 'Name', with: 'userdoesnotexist'
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    
    expect(page).to have_content('Username or password is incorrect.')
  end
end