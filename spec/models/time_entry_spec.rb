RSpec.describe TimeEntry, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :user }
  end

  describe 'validations' do
    let(:user) { FactoryBot.create :user }
    let(:time_entry) { FactoryBot.create :time_entry, user: user }

    subject { time_entry }

    it { expect(time_entry).to be_valid }
    it { is_expected.to validate_presence_of(:date) }
    it { is_expected.to validate_presence_of(:user) }
  end
end
