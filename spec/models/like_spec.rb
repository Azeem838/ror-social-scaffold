require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'validations' do
    it 'should validate presence of content' do
      User.create!(email: 'abc@example.com', password: '123456', name: 'Example')
      Post.create!(user_id: 2, content: 'ascascacascsacsac')
      like = Like.create!(user_id: 2, post_id: 2)
      expect(like.valid?).to be true
    end

    it { should validate_uniqueness_of(:user_id).scoped_to(:post_id) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end
end
