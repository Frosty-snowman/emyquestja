require 'rails_helper'

RSpec.describe Quest, type: :model do
  describe 'attributes' do
    it 'has name and status attrivutes' do
    quest = Quest.new(name :'Test Quest', status: false)
    expect(quest.name).to eq('Test Quest')
    expect(quest.status).to eq(false)
    end
  end

  describe 'validation' do
    it 'is valid with only a name' do
      quest = Quest.new(name :'Test Quest')
      expect(quest).to be_valid
    end
  end
end


#unitest