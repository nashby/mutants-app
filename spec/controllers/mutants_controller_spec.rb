require 'rails_helper'

describe MutantsController do
  render_views

  describe '#index' do
    it 'renders a full list of mutants' do
      Mutant.create!(name: 'Jubilee')
      Mutant.create!(name: 'Karma')

      get :index

      expect(response.body).to have_content('Jubilee')
      expect(response.body).to have_content('Karma')
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
      Team.create!(name: 'Team Jubilee')
    end

    it 'creates new mutant' do
      post :create, mutant: { name: 'Jubilee',
                              description: 'Description of the mutant 1',
                              team_ids: [team.id] }

      mutant = Mutant.last

      expect(Mutant.count).to eq(1)
      expect(mutant.name).to  eq('Jubilee')
      expect(mutant.teams).to include(team)
    end
  end

  describe '#destroy' do
    it 'destroys mutant' do
      mutant = Mutant.create!(name: 'Jubilee')

      expect {
        delete :destroy, id: mutant.id
      }.to change { Mutant.count }.by(-1)
    end
  end
end
