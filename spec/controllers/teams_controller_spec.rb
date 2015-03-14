require 'rails_helper'

describe TeamsController do
  render_views

  describe '#index' do
    it 'renders a full list of teams' do
      Team.create!(name: 'Team Karma')
      Team.create!(name: 'Team Jubilee')

      get :index

      expect(response.body).to have_content('Team Karma')
      expect(response.body).to have_content('Team Jubilee')
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
    let(:task)   { Task.create!(name: 'Task 1') }
    let(:mutant) { Mutant.create!(name: 'Jubilee') }

    it 'creates new team' do
      post :create, team: { name: 'Team Jubilee',
                            description: 'Description of the Team Jubilee',
                            task_ids: [task.id],
                            mutant_ids: [mutant.id] }

      team = Team.last

      expect(Team.count).to eq(1)
      expect(team.name).to eq('Team Jubilee')
      expect(team.tasks).to include(task)
      expect(team.mutants).to include(mutant)
    end
  end

  describe '#update' do
    it 'updates existing team' do
      team = Team.create!(name: 'Team Jubilee')

      put :update, id: team.id, team: { name: 'Team Karma' }

      expect(Team.last.name).to eq('Team Karma')
    end
  end

  describe '#destroy' do
    it 'destroys team' do
      team = Team.create!(name: 'Team Jubilee')

      expect {
        delete :destroy, id: team.id
      }.to change { Team.count }.by(-1)
    end
  end
end
