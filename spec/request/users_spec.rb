require 'rails_helper'

RSpec.describe 'UsersController', type: :request do
  context 'GET #index' do
    before(:example) do
      get '/users'
    end
    it 'returns a 200 status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include('Users index')
    end
  end

  context 'GET show' do
    before(:example) do
      @user = User.create(id: 1, name: 'Gideon', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          bio: 'Software Engineer from Nigeria', postsCounter: 3)
      get '/users/1'
    end

    it 'returns a 200 status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render he show template' do
      expect(response).to render_template(:show)
    end

    it 'should test placeholder text inside template' do
      expect(response.body).to include('This is the user for a given user id')
    end
  end
end
