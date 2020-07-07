require 'rails_helper'

RSpec.describe Following, type: :model do
  before :each do
    User.create(username: 'John', fullname: 'John Kennedy')
    User.create(username: 'Eric', fullname: 'Eric Clapton')
  end
    
end
