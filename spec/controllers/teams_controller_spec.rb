require 'rails_helper'

RSpec.describe TeamsController, type: :controller do
  describe 'POST #create' do
    let!(:user) { create(:user) }

    before do
      session[:user_id] = user.id
    end

    context 'with valid attributes' do
      it 'creates the team' do
        post :create, params: { team: attributes_for(:team) }
        expect(Team.count).to eq(1)
      end
    end

    context 'with invalid attributes' do
      it 'does not create the team' do
        post :create, params: { team: attributes_for(:team, name: nil) }
        expect(Team.count).to eq(0)
      end

      it 're-renders the "new" view' do
        post :create, params: { team: attributes_for(:team, name: nil) }
        expect(response).to render_template(:new)
      end
    end
  end

  context 'DELETE #destroy' do
    it 'removes team' do
      expect(Team.count).to eq(0)
    end
  end
end
