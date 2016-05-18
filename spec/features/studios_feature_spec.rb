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

  context 'creating studios' do
    scenario 'prompts user to fill out a form, the displays new studio' do
      visit '/studios'
      click_link 'Add a studio'
      fill_in 'Name', with: 'Premises'
      click_button 'Create Studio'
      expect(page).to have_content('Premises')
      expect(current_path).to eq '/studios'
    end
  end

  context 'viewing studios' do

    let!(:premises){ Studio.create(name: 'Premises') }

    scenario 'lets a user view a studio' do
      visit '/studios'
      click_link 'Premises'
      expect(page).to have_content 'Premises'
      expect(current_path).to eq "/studios/#{premises.id}"
    end
  end

  context 'editing studios' do

    before { Studio.create name: 'Premises'}

    scenario 'let a user edit a studio' do
      visit '/studios'
      click_link 'Edit Premises'
      fill_in 'Name', with: 'The Premises Studios'
      click_button 'Update Studio'
      expect(page).to have_content 'The Premises Studios'
      expect(current_path).to eq '/studios'
    end
  end
end
