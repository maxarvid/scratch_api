class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :title
      t.float :price
      t.integer :game_number
      t.float :percent_unsold
      t.float :total_unclaimed
      t.integer :top_prize
      t.integer :top_prizes_unclaimed

      t.timestamps
    end
  end
end
