@editor @editor_atto @atto @_bug_phantomjs @atto-chemistry_modal
Feature: MathType for Atto
  To teach maths to students, I need to write equations

  Background:
    Given the following config values are set as admin:
      | config | value | plugin |
      | toolbar | math = wiris | editor_atto |
    And the following "courses" exist:
      | fullname | shortname | format |
      | Course 1 | C1        | topics |
    And the following "course enrolments" exist:
      | user     | course | role           |
      | admin  | C1     | editingteacher |

  @javascript
  Scenario: Use atto to post a chemistry formula
    And I log in as "admin"
    And I navigate to "Plugins" in site administration
    And I click on "Manage filters" "link"
    And I click on "On" "option" in the "MathType by WIRIS" "table_row"
    And I am on "Course 1" course homepage with editing mode on
    And I add a "Forum" to section "0"
    And I set the following fields to these values:
      | Forum name | News Forum |
    And I press "Save and return to course"
    And I follow "News Forum"
    And I press "Add a new discussion topic"
    And I set the following fields to these values:
      | Subject | Test MathType for Atto on Moodle chemistry formulas |
    And I press "ChemType"
    And I wait "5" seconds
    And I set mathtype formula to '<math><mi mathvariant="normal">H</mi><mn>2</mn><mi mathvariant="normal">O</mi></math>'
    And I click on "//button[@id='wrs_modal_button_accept[0]']" "xpath_element"
    And I press "Post to forum"
    And I click on "Test MathType for Atto on Moodle chemistry formulas" "link"
    Then "//img[@alt='straight H 2 straight O']" "xpath_element" should exist
    Then "Wirisformula" should has height 20 with error of 2