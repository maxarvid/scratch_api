module ScraperService
  require 'open-uri'  

  def self.fetch_and_format_html
    doc = Nokogiri::HTML(URI.open('https://www.mainelottery.com/players_info/unclaimed_prizes.html'))
    table = doc.css('.tbstriped')
    rows = table.css('tr')    
    
    games_array = []
    rows[1..].each do |row|
      row_children = row.children
      game_hash = {}
      game_hash['price'] = row_children[0].text
      game_hash['game_number'] = row_children[1].text
      game_hash['title'] = row_children[2].text
      game_hash['percent_unsold'] = row_children[3].text
      game_hash['total_unclaimed'] = row_children[4].text
      game_hash['top_prize'] = row_children[5].text
      game_hash['top_prizes_unclaimed'] = row_children[6].text
      games_array << game_hash
    end
    games_array
  end

  def self.save_games_to_db(games_array)
    games_array.each do |game|
        Game.create(
          price: game['price'][1..].to_f, 
          game_number: game['game_number'],
          title: game['title'],
          percent_unsold: game['percent_unsold'],
          total_unclaimed: game['total_unclaimed'].gsub(/[\$,]/ ,"").to_f,
          top_prize: game['top_prize'][1..].to_i,
          top_prizes_unclaimed: game['top_prizes_unclaimed'].to_i,
        )
    end
    Game.all
  end
end