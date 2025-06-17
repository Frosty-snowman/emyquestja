require 'rails_helper'

RSpec.describe "quests/index", type: :view do
  before do
    assign(:quests, [
      Quest.create!(name: "First Quest", completed: false),
      Quest.create!(name: "Second Quest", completed: true)
    ])
  end

  it "renders a list of quests" do
    render
    
    # Check for quest names in the rendered output
    expect(rendered).to have_content("First Quest")
    expect(rendered).to have_content("Second Quest")
  end

  it "renders the profile section" do
    render
    
    expect(rendered).to have_content("Nattapat Pinrat")
    expect(rendered).to have_content("Farmhouse")
    expect(rendered).to have_content("Developer")
  end

  it "has the quest form" do
    render
    
    expect(rendered).to have_field("quest[name]")
    expect(rendered).to have_button("Add")
  end

  it "has the correct Tailwind CSS classes" do
    render
    
    # Check for main container classes
    expect(rendered).to have_css(".w-full")
    expect(rendered).to have_css(".px-4")
    
    # Check for quest item classes
    expect(rendered).to have_css(".flex.flex-col")
    expect(rendered).to have_css(".rounded-lg")
  end
end