#!/usr/bin/env ruby
require 'ws2812'
require_relative 'skull'

def display(array, colours)
  $hat.clear false
  array.each_with_index do |row, x|
    row.each_with_index do |value, y|
      $hat[x, y] = colours[value]
    end
  end
  $hat.show
end

colours = [
  Ws2812::Color.new(0, 0, 0),
  Ws2812::Color.new(150, 0, 42)
]

$hat = Ws2812::UnicornHAT.new

$hat.rotation = 90

puts "Hit ^C to terminate"

begin
  loop do
    display Skull.call, colours
    sleep 10
  end
rescue Interrupt
# ignored
end

$hat.clear
