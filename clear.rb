#!/usr/bin/env ruby
$:.unshift(File.expand_path('../../lib', __FILE__))
require 'ws2812'

# Init
hat = Ws2812::UnicornHAT.new

hat.clear
