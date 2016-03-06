Feature: Cucumber Steps

  axe-matchers ships with Cucumber steps that can be used out of the box.
  It is actually a single step that can be created by appending clauses to
  refine its behavior. All of the clauses can be mixed and matched; however,
  they must appear in the specified order:

      Then the page should be accessible [including] [excluding] [according-to] [checking-rules/checking-only-rules] [skipping-rules]

  Background:
    Given I use a fixture named "capybara"

  Scenario: Base Step
    Given a scenario like:
      """gherkin
      Given I visit http://abcdcomputech.dequecloud.com
      Then the page should be accessible
      """
    When I run `cucumber`
    Then it should fail with:
      """
      Found 4 accessibility violations
      """

  Scenario: Negated Step
    Given a scenario like:
      """gherkin
      Given I visit http://abcdcomputech.dequecloud.com
      Then the page should not be accessible
      """
    When I run `cucumber`
    Then the feature should pass

  Scenario: Inclusion Clause
    Given a scenario like:
      """gherkin
      Given I visit http://abcdcomputech.dequecloud.com
      Then the page should be accessible within "#header"
      """
    When I run `cucumber`
    Then it should fail with:
      """
      Found 1 accessibility violation
      """

  Scenario: Exclusion Clause
    Given a scenario like:
      """gherkin
      Given I visit http://abcdcomputech.dequecloud.com
      Then the page should be accessible excluding "#topbar"
      """
    When I run `cucumber`
    Then it should fail with:
      """
      Found 3 accessibility violations
      """

  # Scenario: Accessibility Standard (Tag) Clause
  #   Given a feature file with:
  #     """gherkin
  #     Given I visit http://abcdcomputech.dequecloud.com
  #     Then the page should be accessible according to: tag-name
  #     """
  #   Then the feature should pass

  # Scenario: Checking Rules Clause
  #   Given a feature file with:
  #     """gherkin
  #     Given I visit http://abcdcomputech.dequecloud.com
  #     Then the page should be accessible checking: ruleId
  #     """
  #   Then the feature should pass

  # Scenario: Exclusive Rules Clause
  #   Given a feature file with:
  #     """gherkin
  #     Given I visit http://abcdcomputech.dequecloud.com
  #     Then the page should be accessible checking only: ruleId
  #     """
  #   Then the feature should pass

  # Scenario: Skipping Rules Clause
  #   Given a feature file with:
  #     """gherkin
  #     Given I visit http://abcdcomputech.dequecloud.com
  #     Then the page should be accessible skipping: ruleId
  #     """
  #   Then the feature should pass

  # Scenario: Compound Example with punctuation
  #   Given a feature file with:
  #     """gherkin
  #     Given I visit http://abcdcomputech.dequecloud.com
  #     Then the page should be accessible excluding "#sidebar" according to: wcag2a, wcag2aa but skipping: color-contrast
  #     """
  #   Then the feature should pass

  # Scenario: Compound Example with conjunctions
  #   Given a feature file with:
  #     """gherkin
  #     Given I visit http://abcdcomputech.dequecloud.com
  #     Then the page should be accessible excluding "#sidebar"; according to: wcag2a, wcag2aa; skipping: color-contrast
  #     """
  #   Then the feature should pass
