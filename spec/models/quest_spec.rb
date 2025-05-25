require 'rails_helper'

RSpec.describe Quest, type: :model do
  describe 'attributes' do
    it 'has name and status attrivutes' do
    quest = Quest.new(name:'Test Quest',status: false)
    
    expect(quest.name).to eq('Test Quest')
    expect(quest.status).to eq(false)
    end
  end
end
