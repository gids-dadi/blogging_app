require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  context 'GET index' do
    before(:example) do
      @user = User.create(id: 1, name: 'Gideon', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          bio: 'Software Engineer from Nigeria', postsCounter: 3)
      get '/users/1/posts'
    end

    it 'returns a 200 status code' do
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      expect(response).to render_template('index')
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include('Posts index')
    end
  end

  describe 'GET show' do
    before(:example) do
      @user = User.create(id: 1, name: 'Gideon', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          bio: 'Software Engineer from Nigeria', postsCounter: 3)

      @post = Post.create(id: 1, title: 'post 1', text: 'This is the first post', user_id: 1)

      get '/users/1/posts/'
    end

    it 'returns a 200 status code' do
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      expect(response).to render_template('show')
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include('This is the list of posts with a given user id')
    end
  end
end
