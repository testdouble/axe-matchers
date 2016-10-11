require 'capybara/dsl'
require 'minitest/autorun'
require 'axe/matchers'

class TestABCDCompuTech < Minitest::Test
  include Capybara::DSL

  def setup
    Capybara.default_driver = :selenium
    @be_accessible = Axe::Matchers.be_accessible

    visit 'http://abcdcomputech.dequecloud.com/'
  end

  def test_known_to_be_inaccessible_should_fail
    assert @be_accessible.matches? page
  end

  def test_accessible_sub_tree_should_pass
    accessibility_matcher = @be_accessible.within '#working'
    assert accessibility_matcher.matches? page
  end

  def test_inaccessible_sub_tree_should_fail
    accessibility_matcher = @be_accessible.within '#broken'
    assert accessibility_matcher.matches? page
  end

end
