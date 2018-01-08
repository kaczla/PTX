#!/usr/bin/env ruby

rgx = ARGV.shift
#wczyta wszystko do pamieci:
readLines.select{|l| l =~ /#{rgx}/}.each{|l| put l}
