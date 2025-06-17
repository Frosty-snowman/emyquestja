Given("I am on the quest page") do
  visit root_path
end

Given("I wait for the page to load") do
  expect(page).to have_css(".w-full", wait: 5)
end

When("I fill in {string} with {string}") do |field, value|
  fill_in field, with: value
end

When("I press {string}") do |button|
  click_button button
end

Then("I should see {string} within the quest list") do |text|
  within(".w-full") do
    expect(page).to have_content(text)
  end
end

Then("I should not see {string}") do |text|
  expect(page).not_to have_content(text)
end

Then("I should see the error {string}") do |message|
  expect(page).to have_content(message)
end

Given("I have a quest named {string}") do |name|
  Quest.create!(name: name)
end

Given("I wait for the quest to appear") do
  expect(page).to have_css(".w-full", wait: 5)
end

When("I mark the quest {string} as completed") do |name|
  within(".w-full") do
    find("div", text: name).find("input[type='checkbox']").click
  end
end

Then("I should see the quest {string} is completed") do |name|
  within(".w-full") do
    expect(page).to have_css(".line-through", text: name)
  end
end

When("I delete the quest {string}") do |name|
  within(".w-full") do
    within("div", text: name) do
      accept_confirm do
        click_button "Delete"
      end
    end
  end
end
