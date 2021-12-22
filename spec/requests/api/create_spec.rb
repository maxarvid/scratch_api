RSpec.describe 'POST /api/games', type: :request do
  subject { response }

  describe 'successfully' do
    before do
      post '/api/games'
    end
    
    it { is_expected.to have_http_status 201 }
    
    it 'is expected to return all the games' do
      binding.pry
      expect(response_json['games'].count).to eq 181
    end
  end
end
