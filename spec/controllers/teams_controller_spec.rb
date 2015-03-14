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
end
