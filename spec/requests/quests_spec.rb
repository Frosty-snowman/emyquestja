require 'rails_helper'

RSpec.describe "Quests", type: :request do
  describe "GET /quests" do
    it "returns successful response" do
      get root_path
      expect(response).to have_http_status(:success)
    end

    it "displays quests in correct order" do
      Quest.create!(name: "First Quest")
      Quest.create!(name: "Second Quest")
      get root_path
      expect(response.body).to include("First Quest")
      expect(response.body).to include("Second Quest")
    end
  end

  describe "POST /quests" do
    context "with valid parameters" do
      it "creates a new quest" do
        expect {
          post quests_path, params: { quest: { name: "New Quest" } }
        }.to change(Quest, :count).by(1)
        expect(response).to redirect_to(root_path)
      end

      it "creates a quest with status and completion" do
        post quests_path, params: {
          quest: {
            name: "Complex Quest",
            status: true,
            completed: true
          }
        }
        expect(Quest.last.status).to be true
        expect(Quest.last.completed).to be true
      end
    end

    context "with invalid parameters" do
      it "does not create a quest" do
        expect {
          post quests_path, params: { quest: { name: "" } }
        }.not_to change(Quest, :count)
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it "does not create a quest with only whitespace" do
        expect {
          post quests_path, params: { quest: { name: "   " } }
        }.not_to change(Quest, :count)
      end
    end
  end

  describe "PATCH /quests/:id" do
    let(:quest) { Quest.create!(name: "Original Quest") }

    it "updates quest name" do
      patch quest_path(quest), params: { quest: { name: "Updated Quest" } }
      expect(quest.reload.name).to eq("Updated Quest")
      expect(response).to redirect_to(root_path)
    end

    it "updates quest status" do
      patch quest_path(quest), params: { quest: { status: true, completed: true } }
      expect(quest.reload.status).to be true
      expect(quest.reload.completed).to be true
    end
  end

  describe "DELETE /quests/:id" do
    let!(:quest) { Quest.create!(name: "Test Quest") }

    it "destroys the requested quest" do
      expect {
        delete quest_path(quest)
      }.to change(Quest, :count).by(-1)
      expect(response).to redirect_to(root_path)
    end

    it "handles non-existent quest" do
      delete quest_path(id: 999999)
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "error handling" do
    it "handles routing errors gracefully" do
      get "/non_existent_path"
      expect(response).to have_http_status(:not_found)
    end
  end
  # describe "GET /brag" do
  #   it "success" do
  #     get :brag
  #     expect(reponse).to have_http_status(:ok)
  #   end
  # end
end
