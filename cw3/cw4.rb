#!/usr/bin/env ruby

defines = {}

while line=gets
  line = line.strip
  if line =~ /^#define/
    match = line.strip.match(/^#define\s+([^\s]+)\s+([^\s]+)/)
    if match
      defines[match[1]] = match[2]
    end
  else
    defines.each do |key, value|
      line = line.gsub(key, value)
    end
    puts line
  end
end
