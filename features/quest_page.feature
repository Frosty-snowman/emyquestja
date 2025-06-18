Feature: Quest management

  As a user
  I want to manage my quests
  So that I can track my progress

 Scenario: User creates a new quest
  Given I am on the quests page
  When I fill in "✨ เพิ่ม Quest ใหม่..." with "Learn Rails"
  And I press "Add"
  Then I should see "Learn Rails"

Scenario: User deletes a quest
  Given the following quest exists:
    | name      | completed |
    | Old Quest | false     |
  And I am on the quests page
  When I confirm and press "🗑️"
  Then I should not see "Old Quest"


  Scenario: User sees empty message when there are no quests
    Given there are no quests
    And I am on the quests page
    Then I should see "No quests found!"

  Scenario: User completes a quest
    Given the following quest exists:
      | name         | completed |
      | Learn Cucumber | false    |
    And I am on the quests page
    When I check "Learn Cucumber"
    Then I should see "Learn Cucumber" as completed


@javascript
Scenario: User views brag document
  Given I am on the quests page
  When I click "Frosty Brag Document"
  Then I should be on the brag page
  And I should see "Brag Document 2025"
  And I should see "เป้าหมายของ Frosty ในปี 2025"
  And I should see "Manifesto ชีวิต"
  When I click "← BACK"
  Then I should be on the quests page

