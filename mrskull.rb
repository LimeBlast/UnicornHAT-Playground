#!/usr/bin/env ruby
$:.unshift(File.expand_path('../../lib', __FILE__))
require 'ws2812'

def display(array)
  array.each_with_index do |row, x|
    row.each_with_index do |value, y|
      $hat[x, y] = value
    end
  end
  $hat.show
end

# Init
$hat = Ws2812::UnicornHAT.new

$hat.rotation = 90
$hat.clear

l = Ws2812::Color.new(220, 220, 220)
d = Ws2812::Color.new(0, 0, 0)

murray = [] # sourced from http://atariage.com/forums/topic/169238-free-sprites-for-the-taking/

murray << [
  [d, d, l, l, l, l, l, d], #0
  [d, l, l, l, l, l, l, l], #1
  [l, d, l, l, l, d, l, l], #2
  [l, d, d, l, d, d, l, l], #3
  [d, l, l, d, l, l, l, d], #4
  [d, d, d, l, l, l, d, d], #5
  [d, d, d, d, d, l, d, d], #6
  [d, d, d, l, l, l, d, d], #7
].reverse

murray << [
  [d, d, l, l, l, l, l, d], #0
  [d, l, l, l, l, l, l, l], #1
  [l, d, l, l, l, d, l, l], #2
  [l, d, d, l, d, d, l, l], #3
  [d, l, l, d, l, l, l, d], #4
  [d, d, d, l, l, l, d, d], #5
  [d, d, d, l, l, l, d, d], #6
  [d, d, d, d, d, d, d, d], #7
].reverse

puts "Hit ^C to terminate"

begin
  loop do
    display murray[0]
    sleep 0.1
    display murray[1]
    sleep 0.7
  end
rescue Interrupt
# ignored
end

$hat.clear
