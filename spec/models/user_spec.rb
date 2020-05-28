require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'associations' do
    it { should have_many(:dashboards).order(position: :asc).dependent(:destroy) }
  end
end
