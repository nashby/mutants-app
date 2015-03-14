require 'rails_helper'

feature 'Manage tasks' do
  before do
    team = Team.create!(name: 'Team Jubilee')
    team.mutants << Mutant.create!(name: 'Jubilee')
  end

  scenario 'Creating a new one' do
    visit tasks_path
    click_link 'New task'

    fill_in 'Name',         with: 'Task 1'
    fill_in 'Description',  with: 'Task 1 description'
    select  'Team Jubilee', from: 'Team'

    click_button 'Save'

    expect(page.current_path).to eq(task_path(Task.last))
    expect(page).to have_content('Task was successfully created')
  end

  scenario 'Removing existing one' do
    Task.create!(name: 'Task 1')

    visit tasks_path

    click_button('Delete')

    expect(page.current_path).to eq(tasks_path)
    expect(page).to have_content('Task was successfully destroyed')
  end
end
