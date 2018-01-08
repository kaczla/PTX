#!/usr/bin/env ruby

puts count = File.foreach("../cw2/slowa.lst").inject(0) {|c, line| c+1}
