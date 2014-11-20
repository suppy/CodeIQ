#　Sexy Coder  マシューさん, の組合せ最適化の問題
#　マシューの「美女」巡回問題
#　htts://codeiq.j/ace/matthew/q1135


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

p1 = "Katherine"
p2 = "Rose"
p3 = "Eve"
p4 = "Lola"
p5 = "Beth"

bijos = [p1, p2, p3, p4, p5]

h = {
  p1 => "p1",
  p2 => "p2",
  p3 => "p3",
  p4 => "p4",
  p5 => "p5"
}

bijo_map = {
  [p1, p2] =>	1,
  [p1, p3] => 3,
  [p1, p4] =>	4,
  [p1, p5] =>	5,

  [p2, p1] =>	1,
  [p2, p3] =>	2,
  [p2, p4] => 3,
  [p2, p5] =>	4,

  [p3, p1] =>	3,
  [p3, p2] =>	2,
  [p3, p4] =>	1,
  [p3, p5] =>	2,

  [p4, p1] =>	4,
  [p4, p2] =>	3,
  [p4, p3] =>	1,
  [p4, p5] =>	1,

  [p5, p1] =>	5,
  [p5, p2] =>	4,
  [p5, p3] =>	2,
  [p5, p4] =>	1
}

shortest_distance = 100
shortest_route = []
bijos.permutation(bijos.length).to_a.each do |route|
  distance = 0
  (0...(bijos.length-1)).each do |i|
    distance += bijo_map[[route[i], route[i+1]]]
  end
  if shortest_distance > distance
    shortest_distance = distance
    shortest_route = [route]
  elsif shortest_distance == distance
    shortest_route << route
  end
end
shortest_route.each do |route|
  puts route.map { |bijo| h[bijo] }.join(",")
end


exit

# 見つかった最短経路
min_route2 = []
min_route.each do |route|
  route2 = route.clone
  while route2[0] != 1
    route2 << route2.shift 
  end
  min_route2 << route2
end
p min_route2.uniq!
min_route3 = []
min_route2.each do |route|
  if route[1] > route[n-1]
      route2 = []
      route2 << route.shift
      while route.length > 0
        route2 << route.pop
      end
  else
    route2 = route.clone
  end
  min_route3 << route2
end
p min_route3.uniq!.sort!
min_route3.each do |route|
  puts route.join(",")
end


# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
