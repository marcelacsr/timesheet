RSpec.describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_many :time_entries }
  end

  describe 'validations' do
    let(:user) { FactoryBot.create :user }
    subject { user }

    it { expect(user).to be_valid }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:created_at) }
    it { is_expected.to validate_presence_of(:updated_at) }
  end
end
