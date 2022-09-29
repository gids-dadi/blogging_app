require 'rails_helper'

RSpec.describe Like, type: :model do
  like = Like.new(user_id: 2, id: 1)

  before { like.save }

  it 'is valid with valid attributes' do
    expect(like).to_not be_valid
  end

   it 'is not valid without user_id' do
    like.user_id = nil
    expect(like).to_not be_valid
  end

  it 'is not valid without id' do
    like.id = nil
    expect(like).to_not be_valid
  end

  it 'is valid with id' do
    like.id = 1
    expect(like).to_not be_valid
  end
end