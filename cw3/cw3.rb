#!/usr/bin/env ruby

rgx = ARGV.shift
while l=gets
  puts l if l =~ /#{rgx}/
end

#wczyta wszystko do pamieci:
#readLines.select{|l| l =~ /#{rgx}/}.each{|l| put l}
