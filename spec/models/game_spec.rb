RSpec.describe Game, type: :model do
  describe 'DB Table' do
    it { is_expected.to have_db_column :title }
    it { is_expected.to have_db_column :price }
    it { is_expected.to have_db_column :game_number }
    it { is_expected.to have_db_column :percent_unsold }
    it { is_expected.to have_db_column :total_unclaimed }
    it { is_expected.to have_db_column :top_prize }
    it { is_expected.to have_db_column :top_prizes_unclaimed }
  end

  describe 'FactoryBot' do
    it 'is expected to have a valid Factory' do
      expect(create(:game)).to be_valid
    end
  end
  
end
