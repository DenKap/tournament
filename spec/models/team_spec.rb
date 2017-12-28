require 'rails_helper'

RSpec.describe Team, type: :model do
  let!(:user) { create(:user) }

  it 'has a valid factory' do
    expect(build(:team)).to be_valid
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_attachment_content_type(:logo).
        allowing('image/png', 'image/jpg', 'image/jpeg').
        rejecting('text/plain', 'text/xml') }
  end

  describe 'Associations' do
    it { is_expected.to have_many(:participants).dependent(:destroy) }
    it { is_expected.to belong_to(:user) }
  end
end
