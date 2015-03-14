require 'rails_helper'

feature 'Manage mutants' do
  before do
    Team.create!(name: 'Team Jubilee')
  end

  scenario 'Creating a new one' do
    visit mutants_path
    click_link 'New mutant'

    fill_in 'Name',        with: 'Jubilee'
    fill_in 'Description', with: 'Jubilee description'
    select 'Team Jubilee', from: 'Teams'

    click_button 'Save'

    expect(page.current_path).to eq(mutant_path(Mutant.last))
    expect(page).to have_content('Mutant was successfully created')
  end

  scenario 'Removing existing one' do
    Mutant.create!(name: 'Jubilee')

    visit mutants_path

    click_button('Delete')

    expect(page.current_path).to eq(mutants_path)
    expect(page).to have_content('Mutant was successfully destroyed')
  end
end
