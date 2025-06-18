Given("I am on the quests page") do
  visit quests_path
end

When(/^I fill in "(.*)" with "(.*)"$/) do |placeholder, value|
  find("input[placeholder='#{placeholder}']").fill_in(with: value)
end

When('I press {string}') do |button|
  click_button(button)
end

When('I confirm and press {string}') do |button|
  accept_alert do
    click_button(button, match: :first)
  end
end



Then("I should see {string}") do |text|
  expect(page).to have_content(text)
end

Then("I should not see {string}") do |text|
  expect(page).not_to have_content(text)
end

Given("there are no quests") do
  Quest.destroy_all
end

Given("the following quest exists:") do |table|
  table.hashes.each do |row|
    Quest.create!(name: row["name"], completed: row["completed"] == "true")
  end
end

When(/^I check "(.*)"$/) do |quest_name|
  quest = Quest.find_by(name: quest_name)
  within("[data-testid='quest-form-#{quest.id}']") do
    check("quest_completed") # ตรงกับ id หรือ name ของ checkbox
  end
end



Then(/^I should see "(.*)" as completed$/) do |quest_name|
  expect(page).to have_css("h2.line-through", text: quest_name)
end

Then('I should be on the brag page') do
  expect(current_path).to eq(brag_path)
end

When('I click {string}') do |link_text|
  click_link_or_button(link_text)
  sleep 2
end
Then('I should be on the quests page') do
  expect(current_path).to eq(quests_path)
end

