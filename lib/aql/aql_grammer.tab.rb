#
# DO NOT MODIFY!!!!
# This file is automatically generated by racc 1.4.5
# from racc grammer file "lib/aql/aql_grammer.rb".
#

require 'racc/parser'


require 'strscan'


module Aql

  class Parser < Racc::Parser

module_eval <<'..end lib/aql/aql_grammer.rb modeval..id8a49362295', 'lib/aql/aql_grammer.rb', 41

def unquote(value)
  case value
  when /^'(.*)'$/ then $1
  when /^"(.*)"$/ then $1
  else value
  end
end

def unescape_quote(value)
  value.gsub(/\\(['|"])/, '\1')
end

def parse_aql(str)
  @input = str
  tokens = []
  str = "" if str.nil?
  scanner = StringScanner.new(str + ' ')

  until scanner.eos?
    case
    when scanner.scan(/\s+/)
      # ignore space
    when m = scanner.scan(/=/i)
      tokens.push [:EQUAL, m]
    when m = scanner.scan(/and\b/i)
      tokens.push   [:AND, m]
    when m = scanner.scan(/or\b/i)
      tokens.push   [:OR, m]
    when m = scanner.scan(/'(((\\')|[^'])*)'/) # single quoted
      tokens.push   [:IDENTIFIER, unescape_quote(unquote(m))]
    when m = scanner.scan(/"(((\\")|[^"])*)"/) # double quoted
      tokens.push   [:IDENTIFIER, unescape_quote(unquote(m))]
    when m = scanner.scan(/[\w-]+/)
      tokens.push   [:IDENTIFIER, unescape_quote(unquote(m))]
    # when m = scanner.scan(/((\d+\.?\d*)|(\d*\.?\d+))/)
    #   tokens.push   [:IDENTIFIER, m]
    when m = scanner.scan(/(\\"|\\'|[\w-])+/) # start with escaped quate
      tokens.push   [:IDENTIFIER, unescape_quote(m)]
    else
      raise "unexpected characters #{scanner.peek(5)}"
    end
  end
  tokens.push [false, false]
  yyparse(tokens, :each)
end
..end lib/aql/aql_grammer.rb modeval..id8a49362295

##### racc 1.4.5 generates ###

racc_reduce_table = [
 0, 0, :racc_error,
 1, 7, :_reduce_1,
 3, 8, :_reduce_2,
 3, 8, :_reduce_3,
 1, 8, :_reduce_none,
 1, 10, :_reduce_5,
 1, 11, :_reduce_6,
 3, 9, :_reduce_7 ]

racc_reduce_n = 8

racc_shift_n = 15

racc_action_table = [
     9,    10,     2,     8,     2,     6,    12,     2,     2,     9 ]

racc_action_check = [
     4,     4,     7,     3,     0,     1,     8,     9,    10,    14 ]

racc_action_pointer = [
     0,     0,   nil,     3,    -2,   nil,   nil,    -2,     6,     3,
     4,   nil,   nil,   nil,     7 ]

racc_action_default = [
    -8,    -8,    -6,    -8,    -1,    -4,    -5,    -8,    -8,    -8,
    -8,    -7,    15,    -2,    -3 ]

racc_goto_table = [
     4,     7,     3,    11,   nil,   nil,   nil,   nil,   nil,    13,
    14 ]

racc_goto_check = [
     2,     4,     1,     5,   nil,   nil,   nil,   nil,   nil,     2,
     2 ]

racc_goto_pointer = [
   nil,     2,     0,   nil,     0,    -4 ]

racc_goto_default = [
   nil,   nil,   nil,     5,   nil,     1 ]

racc_token_table = {
 false => 0,
 Object.new => 1,
 :AND => 2,
 :OR => 3,
 :IDENTIFIER => 4,
 :EQUAL => 5 }

racc_use_result_var = false

racc_nt_base = 6

Racc_arg = [
 racc_action_table,
 racc_action_check,
 racc_action_default,
 racc_action_pointer,
 racc_goto_table,
 racc_goto_check,
 racc_goto_default,
 racc_goto_pointer,
 racc_nt_base,
 racc_reduce_table,
 racc_token_table,
 racc_shift_n,
 racc_reduce_n,
 racc_use_result_var ]

Racc_token_to_s_table = [
'$end',
'error',
'AND',
'OR',
'IDENTIFIER',
'EQUAL',
'$start',
'target',
'conditions',
'condition',
'operator',
'identifier']

Racc_debug_parser = false

##### racc system variables end #####

 # reduce 0 omitted

module_eval <<'.,.,', 'lib/aql/aql_grammer.rb', 14
  def _reduce_1( val, _values)
 Query.new(:condition => val[0])
  end
.,.,

module_eval <<'.,.,', 'lib/aql/aql_grammer.rb', 18
  def _reduce_2( val, _values)
 Query::And.new(val[0], val[2])
  end
.,.,

module_eval <<'.,.,', 'lib/aql/aql_grammer.rb', 19
  def _reduce_3( val, _values)
 Query::Or.new(val[0], val[2])
  end
.,.,

 # reduce 4 omitted

module_eval <<'.,.,', 'lib/aql/aql_grammer.rb', 24
  def _reduce_5( val, _values)
 '='
  end
.,.,

module_eval <<'.,.,', 'lib/aql/aql_grammer.rb', 28
  def _reduce_6( val, _values)
 val[0]
  end
.,.,

module_eval <<'.,.,', 'lib/aql/aql_grammer.rb', 32
  def _reduce_7( val, _values)
 Query::Condition.new(val[0], val[1], val[2])
  end
.,.,

 def _reduce_none( val, _values)
  val[0]
 end

  end   # class Parser

end   # module Aql
