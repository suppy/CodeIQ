# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：数えやすいように並べ替え
# https://codeiq.jp/ace/thisweek_masuipeo/q1266


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

@width = 4
@height = 4

def display(pattern)
  (0...@width*@height).each do |i|
    if pattern.include?(i)
      print "○"
    else
      print "●"
    end
    print "\n" if i % @width == 3
  end
  print "\n"
end

#
# 
#
def find_near_goal(pattern)
if pattern.include?(0)
  count1 = 0
  goal_pattern1 = (0...@width*@height/2).to_a
  #display(goal_pattern)
  (0...@width*@height).each do |i|
    count1 += 1 if pattern.include?(i) && goal_pattern1.include?(i)
  end
  #p count1
else
  count1 = 0
  goal_pattern1 = (@width*@height/2...@width*@height).to_a
  #display(goal_pattern1)
  (0...@width*@height).each do |i|
    count1 += 1 if pattern.include?(i) && goal_pattern1.include?(i)
  end
  #p count1
end

if pattern.include?(0)
  count2 = 0
  goal_pattern2 = (0...@width*@height).select{|i| i % @width < @width / 2} 
  #p goal_pattern2
  #display(goal_pattern2)
  (0...@width*@height).each do |i|
    count1 += 1 if pattern.include?(i) && goal_pattern2.include?(i)
  end
  #p count2
else
  count2 = 0
  goal_pattern2 = (0...@width*@height).select{|i| i % @width >= @width / 2} 
  #p goal_pattern2
  #display(goal_pattern2)
  (0...@width*@height).each do |i|
    count2 += 1 if pattern.include?(i) && goal_pattern2.include?(i)
  end
  #p count2
end
  if count1 > count2
    count = count1
    goal_pattern = goal_pattern1
  else
    count = count2
    goal_pattern = goal_pattern2
  end
  
  p count
  return goal_pattern
end

def goal?(pattern)
  count = 1
  (1...@width*@height/2).each do |i|
    count += 1 if pattern.include?(0) == pattern.include?(i) 
  end
  return true if count == 8
end

def make_goal_patterns()
  goal_patterns = []
  goal_patterns << (0...@width*@height/2).to_a
  goal_patterns << (@width*@height/2...@width*@height).to_a
  goal_patterns << (0...@width*@height).select{|i| i % @width < @width / 2} 
  goal_patterns << (0...@width*@height).select{|i| i % @width >= @width / 2} 
  
  return goal_patterns
end

goal_patterns = make_goal_patterns()
goal_patterns.each do |goal_pattern|
  display(goal_pattern)
end

#exit

pattern = (1..7).to_a + [10]
pattern = (1..6).to_a + [10, 12]
#pattern = [1, 3, 5, 7, 9, 11, 13, 15]
pattern = [1, 3, 4, 6, 9, 11, 12, 14]
pattern = [0, 1, 3, 4, 7, 12, 13, 15] 
pattern = [3, 6, 7, 10, 11, 13, 14, 15]
pattern = [4, 5, 6, 7, 9, 11, 12, 15]
display(pattern)
#@goal_pattern = find_near_goal(pattern)
#display(@goal_pattern)

#exit

def rotate(pattern)
  (0...@width*@height).each do |i|
    x, y = i % @width, i / @width 
    next_x = (@width - 1) - y
    next_y = x
  end
end


@memo = {}

def count_move(pattern, goal_pattern)
  start_pattern = pattern.clone
  total_dis = 0
  (0...@width*@height).each do |i|
    #puts "has key" if @memo.has_key?(pattern)
    return total_dis + @memo[[pattern, goal_pattern]] if @memo.has_key?([pattern, goal_pattern])
    next if !goal_pattern.include?(i) || pattern.include?(i) == goal_pattern.include?(i)
    #display(pattern)
    
    x1, y1 = i % @width, i / @width
    #print "(#{x1},#{y1})\n"
    min_dis = Float::INFINITY
    min_x2, min_y2 = 0, 0
    min_j = 0
    (0...@width*@height).each do |j|
      next if i == j
      next if !pattern.include?(j) || goal_pattern.include?(j)
      #print "#{i} #{j}\n"
      x2, y2 = j % @width, j / @width
      dis = (x2 - x1).abs + (y2 - y1).abs
      #print "(#{x1},#{y1}) (#{x2},#{y2}) dis:#{dis}\n"
      if min_dis > dis
        min_dis = dis
        min_x2, min_y2 = x2, y2
        min_j = j
      end
    end
    #print "(#{x1},#{y1}) (#{min_x2},#{min_y2}) #{min_j} min_dis:#{min_dis}\n"
    total_dis += min_dis
    pattern = (pattern + [i] - [min_j]).sort
    #p pattern
    #display(pattern)
  end
  #p total_dis
  @memo[[start_pattern, goal_pattern]] = total_dis
  #p @memo
  return total_dis
end

=begin
p count_move(pattern)
p @memo
pattern = [0, 1, 3, 4, 7, 12, 13, 15] 
p count_move(pattern)
=end

(0...@width*@height).to_a.combination(@width*@height/2) do |pattern|

end
puts "end loop"

max_count = 0
max_pattern = []

patterns = (0...@width*@height).to_a.combination(@width*@height/2).to_a
pattern = patterns[1000]
  #@goal_pattern = find_near_goal(pattern)
  goal_patterns = make_goal_patterns()
  goal_pattern = goal_patterns[0]
(0...@width*@height).to_a.combination(@width*@height/2) do |pattern|
  min_count = Float::INFINITY
  min_pattern = []
  goal_patterns.each do |goal_pattern|
    if @memo.has_key?([pattern, goal_pattern])
      count = @memo[[pattern, goal_pattern]]
      puts "has_key"
    else
      count = count_move(pattern.clone, goal_pattern)
    end
    if min_count > count
      min_count = [count, min_count].min
      min_pattern = [pattern, goal_pattern]
    end
  end
  if min_count > max_count
    max_count = min_count 
    max_pattern = min_pattern
  end
  #p @memo.length
end
p max_count
#p max_pattern
display(max_pattern[0])
display(max_pattern[1])

# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
