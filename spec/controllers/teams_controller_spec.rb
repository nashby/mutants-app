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
    it 'creates new team' do
      post :create, team: { name: 'Team Jubilee', description: 'Description of the Team Jubilee' }

      expect(Team.count).to eq(1)
      expect(Team.last.name).to eq('Team Jubilee')
    end
  end
end
