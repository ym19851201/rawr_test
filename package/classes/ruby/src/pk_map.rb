#!ruby -Ku
# encoding: utf-8

require 'yaml'
require 'pp'
require_relative './test3'
map = parse
map.each do |k, v|
  puts "#{k}:#{v}"
end
file = open("./map.yaml", "w")
data = YAML.dump(map, file)
file.close
