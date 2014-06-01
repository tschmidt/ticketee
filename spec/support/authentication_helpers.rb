module AuthenticationHelpers
  def sign_in_as!(user)
    visit '/sessions/new'
    fill_in 'Name', with: user.name
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    expect(page).to have_content('Signed in successfully.')
  end
end

RSpec.configure do |conf|
  conf.include AuthenticationHelpers, type: :feature
end
