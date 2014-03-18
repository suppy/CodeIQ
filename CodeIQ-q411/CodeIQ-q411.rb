#!/usr/bin/ruby

require 'net/http'

$routeArray = []

def get_next src
  print src + ':' 
  destArray = []
  nth = 0
  dest = src
  loop do
    path = '/deepest.cgi?id=' + dest + '&nth=' + nth.to_s
    result = Net::HTTP.get('133.242.134.37', path).chomp!
    destArray << result
#    p destArray
    if result == '0' then
#      destArray.delete('0')
    p destArray
      return destArray
    end
#deep    4363616111476
#deeper  5092488161056
#deepest 8838746292440
    if result == '4363616111476' then
      p destArray
      p 'reach deep'
      destArray = []
      destArray << result
      return destArray
    end
    if result == '5092488161056' then
      p destArray
      p 'reach deeper'
      destArray = []
      destArray << result
      return destArray
    end
    if result == '8838746292440' then
      p destArray
      p 'reach deepest'
      destArray = []
      destArray << result
      print 'route:' + $routeArray
      exit
    end

    nth += 1
    sleep 0.5
  end
end

def next_destArray destArray
  if destArray[-1] == '0' then
    destArray.delete('0')
    destArray.each { |src|
      if $routeArray.index(src) == nil then
        $routeArray.push(src)
        p $routeArray
        next_destArray get_next src
        $routeArray.pop
      end
    }
  else
    p $routeArray
    destArray << '0'
    next_destArray destArray
  end
end

destArray = []

src = '5426528869786'
destArray << src
destArray << '0'
#$routeArray << src
p destArray

next_destArray destArray

exit

#start 5426528869786
start = '5426528869786'
nth = 0
loop do
path = '/deepest.cgi?id=' + start + '&nth=' + nth.to_s
result = Net::HTTP.get('133.242.134.37', path).chomp!

print start + ' => ' + result + "\n"
if result == '0' then
  break
end
nth = nth + 1
end


#via = '2484466449149'
#via = '4326837688991'
via = '5622625817530'
nth = 0
loop do
path = '/deepest.cgi?id=' + via + '&nth=' + nth.to_s
#p path
print via + ' => '

sleep 0.5
result = Net::HTTP.get('133.242.134.37', path).chomp!

print result + "\n"
if result == '0' then 
  break
end
nth = nth + 1
end

#deep    4363616111476
#deeper  5092488161056
#deepest 8838746292440

