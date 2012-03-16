Feature: Logging in
  In order to play music
  As a user 
  I want to upload them easily

  Scenario:
    Given I am on the homepage
    When I fill in "email" with "admin@admin.com"
    And I fill in "password" with "admin"
    And I press "Log in"
    Then I should see "Logged in!" 
