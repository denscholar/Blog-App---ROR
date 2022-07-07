require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  context 'GET /index' do
    before(:example) { get '/posts' }

    it 'Check if response status is correct' do
      expect(response).to have_http_status(200)
      expect(response).to have_http_status(:ok)
    end
    it 'Check if the correct template is rendered' do
      expect(response).to render_template(:index)
    end

    it 'Check if the response body includes the correct placeholder text' do
      expect(response.body).to include('Here is the index page for post')
    end
  end
  context 'GET /show' do
    before(:example) { get '/posts/:id' }

    it 'Check if response status is correct' do
      expect(response).to have_http_status(:ok)
      expect(response).to have_http_status(200)
    end

    it 'Check if the correct template is rendered' do
      expect(response).to render_template(:show)
    end

    it 'Check if the response body includes the correct placeholder text' do
      expect(response.body).to include('Shows a list of post')
    end
  end
end
