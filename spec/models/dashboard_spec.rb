require 'rails_helper'

RSpec.describe Dashboard, type: :model do
  subject { build(:dashboard) }

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_least(3) }
    it { should_not validate_presence_of(:content) }
  end
end
