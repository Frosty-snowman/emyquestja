# spec/models/quest_spec.rb
require 'rails_helper'

RSpec.describe Quest, type: :model do
  
  # Test สำหรับ attributes
  describe 'attributes' do
    it 'has name and completed attributes' do
      quest = Quest.new(name: 'Test Quest', completed: false)
      expect(quest.name).to eq('Test Quest')
      expect(quest.completed).to eq(false)
    end
  end

  # Test สำหรับ validations
  describe 'validations' do
    it 'is valid with a name' do
      quest = Quest.new(name: 'Test Quest')
      expect(quest).to be_valid
    end
  end

  # Test สำหรับ default values
  describe 'default values' do
    it 'defaults completed to false' do
      quest = Quest.new(name: 'Test Quest')
      expect(quest.completed).to be_falsy
    end
  end

  # Test สำหรับ database operations
  describe 'database operations' do
    it 'can be destroyed' do
      quest = Quest.create!(name: 'Quest to Delete')
      quest_id = quest.id
      quest.destroy!
      
      expect(Quest.find_by(id: quest_id)).to be_nil
    end
  end
end