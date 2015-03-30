# エクスペリンクマーケティング株式会社  城下愛子さんからのデータマイニングの問題
# データマイニングの基礎　グループ分け
# https://codeiq.jp/ace/joshita/q1136


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

valuation = {1 => [5, 9, 5, 6, 1],
             2 => [2, 7, 8, 3, 3],
             3 => [4, 4, 9, 8, 2],
             4 => [7, 7, 9, 4, 6],
             5 => [8, 1, 6, 7, 8],
             6 => [4, 4, 4, 8, 9],
             7 => [7, 3, 7, 8, 8]}
              
p valuation

pairs = {} 
(1..7).each do |k|
  (1..7).each do |j|
    next if k == j
    value = 0
    (0...5).each do |i|
      value += (valuation[k][i] - valuation[j][i]) ** 2 
    end
    pairs[[k, j]] = value
  end
end

pairs = pairs.sort {|(pair1, value1), (pair2, value2)|
  value1 <=> value2
}
 
p pairs

=begin
persons = (1..7).to_a
link_pair = {}
groups = []
pairs.each do |pair, value|
  p pair
  link_pair[pair] = 1
  person1, person2 = pair[0], pair[1]
  groups << pair
  
  next_groups = []
  groups.each do |group|
    break if group[-1] == person1
    next_persons = []
    p persons
    persons.each do |person|
      next_persons = persons.clone
      next if person1 == person && group.length == 2
      next if link_pair[[group[-1], person]] == nil
      #next if person1 != i
      if person1 == person
        print "reach #{group},#{person}\n"
        next_persons = next_persons - group - [person]
      end
      next_groups << group + [person]
    end
    persons = next_persons
  end
  p next_groups
  groups = next_groups
  
  print "\n"
end
=end

# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
