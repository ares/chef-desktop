#!/usr/bin/ruby
require 'rubygems'
require 'googlecharts'


def sum_up(score)
  score.inject {|sum, sc| sum + sc }
end

def print_score(player, score)
  puts "Score for player #{player} is: #{score}"
end

def get_cummulative(score)
  data = []
  score.each { |sc| data.push((data.last || 0) + sc)}
  data
end

sc1 = []
sc2 = []
scin1 = nil
scin2 = nil
n = 1

print "Enter name for player 1: "
p1 = gets.chomp
print "Enter name for player 2: "
p2 = gets.chomp

while scin1 != 'x' && scin2 != 'x'
  puts "Score for #{p1}, round " + n.to_s + ":"
  scin1 = gets.chomp
  sc1.push scin1.to_i
  puts "Score for #{p2}, round " + n.to_s + ":"
  scin2 = gets.chomp
  sc2.push scin2.to_i
  n += 1
end

puts "Results:"
sum1 = sum_up(sc1)
sum2 = sum_up(sc2)

print_score(p1, sum1)
print_score(p2, sum2)

title = "Winner is player " + (sum1 > sum2 ? p1 : p2)
puts title

cum1 = get_cummulative(sc1)
cum2 = get_cummulative(sc2)
chart = Gchart.new  :data => [cum1, cum2], 
                    :title => title,
                    :filename => '/tmp/scrabble.png',
                    :type => 'line',
                    :legend => ["#{p1} (#{sum1})", "#{p2} (#{sum2})"],
                    :line_colors => '0000ff,ff0000'
chart.write
`gwenview /tmp/scrabble.png`
