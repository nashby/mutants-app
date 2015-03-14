require 'rails_helper'

describe TasksController do
  render_views

  describe '#index' do
    it 'renders a full list of tasks' do
      Task.create!(name: 'Task 1')
      Task.create!(name: 'Task 2')

      get :index

      expect(response.body).to have_content('Task 1')
      expect(response.body).to have_content('Task 2')
    end
  end

  describe '#new' do
    it 'renders form' do
      get :new

      expect(response.body).to have_field('Name')
      expect(response.body).to have_field('Description')
      expect(response.body).to have_button('Save')
    end
  end

  describe '#create' do
    let(:team)   do
      team = Team.create!(name: 'Team Jubilee')
      team.mutants << Mutant.create!(name: 'Jubilee')

      team
    end

    it 'creates new task' do
      post :create, task: { name: 'Task 1',
                            description: 'Description of the task 1',
                            team_id: team.id }

      task = Task.last

      expect(Task.count).to eq(1)
      expect(task.name).to eq('Task 1')
      expect(task.team).to eq(team)
    end
  end

  describe '#update' do
    it 'updates existing task' do
      task = Task.create!(name: 'Task 1')

      put :update, id: task.id, task: { name: 'Task 2' }

      expect(Task.last.name).to eq('Task 2')
    end
  end

  describe '#destroy' do
    it 'destroys task' do
      task = Task.create!(name: 'Task 1')

      expect {
        delete :destroy, id: task.id
      }.to change { Task.count }.by(-1)
    end
  end
end
