require 'rails_helper'

feature 'Manage teams' do
  before do
    Task.create!(name: 'Task 1')
    Mutant.create!(name: 'Jubilee')
  end

  scenario 'Creating a new one' do
    visit teams_path
    click_link 'New team'

    fill_in 'Name',        with: 'Team Jubilee'
    fill_in 'Description', with: 'Team Jubilee description'
    select 'Jubilee',      from: 'Mutants'
    select 'Task 1',       from: 'Tasks'

    click_button 'Save'

    expect(page.current_path).to eq(team_path(Team.last))
    expect(page).to have_content('Team was successfully created')
  end

  scenario 'Removing existing one' do
    Team.create!(name: 'Team Jubilee')

    visit teams_path

    click_button('Delete')

    expect(page.current_path).to eq(teams_path)
    expect(page).to have_content('Team was successfully destroyed')
  end
end
