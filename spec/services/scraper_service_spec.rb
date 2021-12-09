RSpec.describe 'ScraperService', type: :service do
  describe 'successfully' do
    
    it 'is expected to call the url once' do
      ScraperService.fetch_and_format_html
      expect(
        a_request(:get, %r{https://www.mainelottery.com/players_info/unclaimed_prizes.html})
      ).to have_been_made.once
    end

    it 'is expected to save games to the database' do
      games_array = ScraperService.fetch_and_format_html
      ScraperService.save_games_to_db(games_array)
      expect(Game.count).to eq games_array.length
    end
    
  end
end
