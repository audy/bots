# encoding: UTF-8

require './hector.rb'
require 'chatterbot/dsl'

HECTOR = Hector.new

body = "*#{HECTOR.do_something}*"
puts body
tweet body
