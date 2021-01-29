require_relative '../support/login_helper'
RSpec.describe 'QuestionAccesses', type: :request do
  describe 'GET /users/time_entries' do
    let!(:user) { FactoryBot.create :user }
    let!(:time_entries) do
      FactoryBot.create_list(:time_entry, 5, user: user) do |time_entry, i|
        time_entry.date = Date.today + (1 * i)
        time_entry.first_period_in = Date.today + (1 * i)
        time_entry.first_period_out = Date.today + (1 * i)
        time_entry.second_period_in = Date.today + (1 * i)
        time_entry.second_period_out = Date.today + (1 * i)
      end
    end

    describe '#index' do
      context 'user logged' do


      before(:each) do
        login_user(user)
        get users_time_entries_path
      end

      it 'returns status 200 ok' do
        expect(response).to have_http_status(200)
      end

      it { expect(response.body).to include('Historico') }

    end
    end

    describe "user not log in" do
      before :each do
        login_user nil
      end

      it "should be redirected to signin" do
        get :index
        expect( response ).to redirect_to( new_user_session_path )
      end
    end
  end
end

