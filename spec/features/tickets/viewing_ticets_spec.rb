require 'spec_helper'

feature 'Viewing tickets' do
  before do
    user = FactoryGirl.create(:user)
    textmate2 = FactoryGirl.create(:project, name: 'TextMate 2')

    FactoryGirl.create(:ticket, project: textmate2,
                                title: 'Make it shiny!',
                                description: 'Gradients! Starbursts! Oh, my!',
                                user: user)

    internet_explorer = FactoryGirl.create(:project, name: 'Internet Explorer')
    
    FactoryGirl.create(:ticket, project: internet_explorer,
                                title: 'Standards compliance',
                                description: "Isn't a joke!",
                                user: user)
    visit '/'
  end
  
  scenario 'Viewing tickets for a given project' do
    click_link 'TextMate 2'
    expect(page).to have_content("Make it shiny!")
    expect(page).to have_no_content("Standards compliance")
    
    click_link 'Make it shiny!'
    within('#ticket h2') do
      expect(page).to have_content('Make it shiny!')
    end
    
    expect(page).to have_content('Gradients! Starbursts! Oh, my!')
  end
end