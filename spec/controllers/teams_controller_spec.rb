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
end
