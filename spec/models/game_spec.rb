RSpec.describe Game, type: :model do
  describe 'DB Table' do
    it { is_expected.to have_db_column :title }
  end
end
