require 'rails_helper'

RSpec.describe Quest, type: :model do
  describe "validations" do
    it "is valid with valid attributes" do
      quest = Quest.new(name: "Test Quest", status: false)
      expect(quest).to be_valid
      expect(quest.name).to eq("Test Quest")
      expect(quest.status).to eq(false)
    end

    it "is not valid without a name" do
      quest = Quest.new(status: false)
      expect(quest).not_to be_valid
      expect(quest.errors[:name]).to include("can't be blank")
    end

    it "is valid without a status" do
      quest = Quest.new(name: "Test Quest")
      expect(quest).to be_valid
      expect(quest.status).to be_nil
    end
  end

  describe "database operations" do
    it "can be created with valid attributes" do
      quest = Quest.create!(name: "New Quest")
      expect(Quest.find(quest.id)).to eq(quest)
    end

    it "can be updated" do
      quest = Quest.create!(name: "Original Name")
      quest.update!(name: "Updated Name")
      expect(quest.reload.name).to eq("Updated Name")
    end

    it "can be deleted" do
      quest = Quest.create!(name: "To Be Deleted")
      expect { quest.destroy }.to change(Quest, :count).by(-1)
    end
  end

  describe "status management" do
    let(:quest) { Quest.create!(name: "Test Quest") }

    it "can be marked as completed" do
      quest.update(status: true, completed: true)
      expect(quest.reload).to be_completed
    end

    it "can be marked as incomplete" do
      quest.update(status: true, completed: true)
      quest.update(status: false, completed: false)
      expect(quest.reload).not_to be_completed
    end
  end

  describe "scopes and queries" do
    before do
      Quest.create!(name: "First Quest", status: true, completed: true)
      Quest.create!(name: "Second Quest", status: false, completed: false)
    end
  end

  describe "edge cases" do
    it "handles very long quest names" do
      long_name = "a" * 255
      quest = Quest.new(name: long_name)
      expect(quest).to be_valid
    end

    it "handles special characters in quest names" do
      quest = Quest.new(name: "Quest #1 with @special! characters")
      expect(quest).to be_valid
    end

    it "trims whitespace from quest names" do
      quest = Quest.create!(name: "  Quest with spaces  ")
      expect(quest.reload.name).to eq("Quest with spaces")
    end
  end

  describe "associations and dependencies" do
    it "can be queried with various conditions" do
      quest = Quest.create!(name: "Test Quest", status: true)
      found_quest = Quest.find_by(status: true)
      expect(found_quest).to eq(quest)
    end
  end
end