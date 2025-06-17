Feature: Quest Management
  As a user
  I want to manage my quests
  So that I can track my tasks and progress

  Background:
    Given I am on the quest page
    And I wait for the page to load

  @javascript
  Scenario: User successfully creates a quest
    When I fill in "quest[name]" with "เรียน Ruby on Rails"
    And I press "Add"
    Then I should see "เรียน Ruby on Rails" within the quest list

  @javascript
  Scenario: User completes a quest
    Given I have a quest named "Complete E2E Testing"
    And I wait for the quest to appear
    When I mark the quest "Complete E2E Testing" as completed
    Then I should see the quest "Complete E2E Testing" is completed

  @javascript
  Scenario: User deletes a quest
    Given I have a quest named "Delete This Quest"
    And I wait for the quest to appear
    When I delete the quest "Delete This Quest"
    Then I should not see "Delete This Quest"

  @javascript
  Scenario: User tries to create an empty quest
    When I fill in "quest[name]" with ""
    And I press "Add"
    Then I should see the error "can't be blank"