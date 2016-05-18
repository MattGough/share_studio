require 'rails_helper'

feature 'reviewing' do

  before { Studio.create name: 'The Premises' }

  scenario 'allows users to leave a review using a form' do
    visit 'studios'
    click_link 'Review The Premises'
    fill_in 'Thoughts', with: "Amazing"
    select '5', from: 'Rating'
    click_button 'Leave Review'

    expect(current_path).to eq '/studios'
    expect(page).to have_content('Amazing')
  end
end
