require 'rails_helper'

RSpec.describe Following, type: :model do
  before :each do
    User.create(username: 'John', fullname: 'John Kennedy')
    User.create(username: 'Eric', fullname: 'Eric Clapton')
  end

  it 'confirms user1 being followed by user2' do
    user1 = User.first
    user2 = User.last
    user1.followers.push(user2)
    expect(user1.followers.count).to eq(1)
    expect(user1.followers.first.username).to eq('Eric')
  end

  it 'confirms user1 following user2' do
    user1 = User.first
    user2 = User.last
    user1.followed.push(user2)
    expect(user1.followed.count).to eq(1)
    expect(user1.followed.first.username).to eq('Eric')
  end
end
