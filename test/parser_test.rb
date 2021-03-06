require File.join(File.dirname(__FILE__), '/test_helper.rb')

class ParserTest < Test::Unit::TestCase

  class User < ActiveRecord::Base
  end

  def setup
    define_schema do
      create_table :users do |t|
        t.column :name, :string
      end
    end
    @parser = Aql::Parser.new
  end

  def test_parse_identifier
    assert_equal({:conditions => 'name = "kuli"'}, @parser.parse_aql('name = kuli').find_options(User))
  end

  def test_parse_identifier_quated_by_double_quate
    assert_equal({:conditions => 'name = "kuli"'}, @parser.parse_aql('name = "kuli"').find_options(User))
  end

  def test_parse_identifier_quated_by_single_quate
    assert_equal({:conditions => 'name = "kuli"'}, @parser.parse_aql('name = \'kuli\'').find_options(User))
  end

  def test_parse_identifier_quated_by_double_quate_including_escaped_double_quate
    assert_equal({:conditions => "name = \"ku\\\"li\""}, @parser.parse_aql('name = "ku\"li"').find_options(User))
  end

  def test_parse_identifier_quated_by_single_quate_including_escaped_single_quate
    assert_equal({:conditions => "name = \"ku'li\""}, @parser.parse_aql("name = 'ku\\'li'").find_options(User))
  end

  def test_parse_identifier_starts_with_escaped_quate
    assert_equal({:conditions => 'name = "\'kuli"'}, @parser.parse_aql("name = \\'kuli").find_options(User))
    assert_equal({:conditions => 'name = "\\"kuli"'}, @parser.parse_aql("name = \\\"kuli").find_options(User))
  end

end
