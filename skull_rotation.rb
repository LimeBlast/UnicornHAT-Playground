#!/usr/bin/env ruby
require 'ws2812'
require 'color'
require 'color-generator'
require 'chroma'

require_relative 'skull'

def display(array)
  $hat.clear false

  hex = ColorGenerator.new(saturation: 0.3, lightness: 0.75).create_hex

  array.each_with_index do |row, x|
    c = Color::RGB.by_hex(hex)
    colour = Ws2812::Color.new(c.red.to_i, c.green.to_i, c.blue.to_i)

    row.each_with_index do |pixel, y|
      $hat[x, y] = colour if pixel > 0
    end

    hex = hex.paint.darken(6).to_hex
  end
  $hat.show
end

$hat = Ws2812::UnicornHAT.new

$hat.rotation = 90

puts "Hit ^C to terminate"

begin
  loop do
    display Skull.call
    sleep 1.5
  end
rescue Interrupt
# ignored
end

$hat.clear
