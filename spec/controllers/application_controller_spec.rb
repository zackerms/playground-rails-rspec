require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  controller do
    def not_found
      render_404
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
