require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  controller do
    def index
      render plain: "[INDEX] Hello, World!"
    end

    def show
      render plain: "[SHOW] Hello, World #{params[:id]}"
    end

    def not_found
      render_404
    end
  end

  describe 'GET #index' do
    it 'renders the index page with correct status' do
      get :index
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("[INDEX] Hello, World!")
    end
  end

  describe 'GET #show' do
    it 'renders the show page with correct status' do
      get :show, params: { id: 1 }
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("[SHOW] Hello, World 1")
    end
  end

  describe 'GET #not_found' do
    it 'renders the 404 page with correct status' do
      routes.draw { get 'not_found' => 'anonymous#not_found' }
      get :not_found
      expect(response).to have_http_status(:not_found)
      expect(response.body).to include("404")
    end
  end
end
