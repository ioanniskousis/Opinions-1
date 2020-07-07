require 'rails_helper'

RSpec.describe Like, type: :model do
  before :each do
    User.create(username: 'John', fullname: 'John Kennedy')
    User.create(username: 'Eric', fullname: 'Eric Clapton')
    @text = 'The coronavirus pandemic is exposing a central flaw in America’s health care system.'
  end
  
  it 'confirms creating an opinion and adding 2 likes' do
    user1 = User.first
    user2 = User.last
    Opinion.create(author_id: User.first.id, text: @text)
    # Like.create(opinion_id: Opinion.first.id, user_id: user1.id)
    # Like.create(opinion_id: Opinion.first.id, user_id: user2.id)

    Opinion.first.likers.push(user1)
    Opinion.first.likers.push(user2)
    
    # expect(Opinion.all.count).to eq(1)
    # expect(Opinion.first.text).to eq(@text)
    expect(Opinion.first.likes.count).to eq(2)
    # expect(User.all.count).to eq(2)

  end

end
