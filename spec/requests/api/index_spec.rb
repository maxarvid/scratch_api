RSpec.describe 'GET /api/games', type: :request do
  subject { response }

  describe 'successfully' do
    let!(:game) { 3.times { create(:game) } }

    before do
      get '/api/games'
    end

    it { is_expected.to have_http_status 200 }

    it 'is expected to return all the games' do
      expect(response_json['games'].count).to eq 3
    end
  end

  describe 'unsuccessfully' do
    describe 'when there are no games in the database' do
      before do
        get '/api/games'
      end

      it { is_expected.to have_http_status 404 }

      it 'is expected to return a message indicating that there are no games' do
        expect(response_json['message']).to eq 'There are no games in the database.'
      end
    end
  end
end
