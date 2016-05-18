require 'rails_helper'

feature 'studios' do
  context 'no studios have been added' do
    scenario 'should display a prompt to add a studio' do
      visit '/studios'
      expect(page).to have_content 'No studios yet'
      expect(page).to have_link 'Add a studio'
    end
  end

  context 'studios have been added' do
    before do
      Studio.create(name: 'Premises')
    end

    scenario 'display studios' do
      visit '/studios'
      expect(page).to have_content('Premises')
      expect(page).not_to have_content('No studios yet')
    end
  end
end
