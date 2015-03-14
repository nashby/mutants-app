require 'rails_helper'

feature 'Teams' do
  scenario 'Creating a new one' do
    visit teams_path
    click_link 'New team'

    fill_in 'Name',        with: 'Team Jubilee'
    fill_in 'Description', with: 'Team Jubilee description'

    click_button 'Save'

    expect(page.current_path).to eq(team_path(Team.last))
    expect(page).to have_content('Team was successfully created')
  end
end
