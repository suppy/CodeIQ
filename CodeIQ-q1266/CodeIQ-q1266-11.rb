#coding: utf-8

# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：数えやすいように並べ替え
# https://codeiq.jp/ace/thisweek_masuipeo/q1266


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

@w = 6
@h = 4

#
# パターンの表示
#
def display(pattern)
  (@w*@h).times do |i|
    if pattern % 2 == 1
      print "○"
    else
      print "●"
    end
    print "\n" if i % @w == @w - 1
    pattern /= 2
  end
  print "\n"
  return
end

#
# パターンの指定位置を反転
#
def reverse(pattern, pos)
  if (pattern >> pos) % 2 == 1
    pattern -= 1 << pos
  else
    pattern += 1 << pos
  end
  return pattern
end

#
# パターンの２つの位置の色を交換
#
def swap(pattern, pos1, pos2)
  pattern = reverse(pattern, pos1)
  pattern = reverse(pattern, pos2)
  return pattern
end

#
# パターンを180度回転
#
def rotate180(pattern)
  rotate_pattern = 0
  (@w*@h).times do |i|
    rotate_pattern += 1 << (@w*@h - 1 - i) if pattern % 2 == 1
    pattern /= 2
  end
  return rotate_pattern
end

#
# パターンを左右反転
#
def flip(pattern)
  flip_pattern = 0
  (0...@h).each do |y|
    (0...@w/2).each do |x|
      pos1 = x + y * @w
      pos2 = @w - 1 - x + y * @w
      flip_pattern += (((pattern >> pos1) % 2) << pos2) + (((pattern >> pos2) % 2) << pos1)
    end
  end
  return flip_pattern
end

#
# パターンの色を反転
#
def invert(pattern)
  invert_pattern = (2 ** (@w*@h) - 1) ^ pattern
  return invert_pattern
end

#
# パターンの回転、左右反転、色の反転などのパターンを生成
#
def symmetry(pattern)
  patterns = [pattern]
  patterns << rotate180(pattern)
  patterns << flip(pattern)
  patterns << flip(rotate180(pattern))
  patterns << invert(pattern)
  patterns << invert(rotate180(pattern))
  patterns << invert(flip(pattern))
  patterns << invert(flip(rotate180(pattern)))
  return patterns
end

#
# ゴールのパターンを生成
#
def make_goal_patterns()
  goal_patterns = []
  pattern = 0
  (@w*@h/2).times do
    pattern *= 2
    pattern += 1
  end
  goal_patterns << pattern
  goal_patterns << invert(pattern)
  
  pattern = 0
  (@w*@h).times do |i|
    pattern *= 2
    pattern += 1 if i % @w < @w / 2
  end
  goal_patterns << pattern
  goal_patterns << invert(pattern)
  
  return goal_patterns
end

#
# パターンの位置から一番近い色違いの場所と移動距離を見つける
#
def find_near_opposite_color(pattern, pos, goal_pattern)
  min_dis = Float::INFINITY
  min_poses = []
  x1, y1 = pos % @w, pos / @w
  # すべての位置について処理を行う
  (0...@w*@h).each do |i|
    next if pos == i
    next if (pattern >> pos) % 2 == (pattern >> i) % 2
    next if (pattern >> i) % 2 == (goal_pattern >> i) % 2
    x2, y2 = i % @w, i / @w
    dis = (x2 - x1).abs + (y2 - y1).abs
    # 最短距離を更新
    if min_dis > dis
      min_dis = dis
      min_poses = [i]
    elsif min_dis == dis
      min_poses << i
    end
  end
  return min_poses, min_dis
end

#
# パターンからゴールまで再帰探索する
# ゴールまでの移動回数はメモ化しておく
#
def search(pattern, goal_pattern)
  if pattern == goal_pattern
    @memo[pattern] = 0
    return
  end
  # すべての位置について処理を行う
  (0...@w*@h).each do |pos1|
    next if (pattern >> pos1) % 2 == (goal_pattern >> pos1) % 2
    poses, length = find_near_opposite_color(pattern, pos1, goal_pattern)
    # 一番近い色違いの位置について処理を行う
    poses.each do |pos2|
      # 移動
      next_pattern = swap(pattern, pos1, pos2)
      # メモ化されていなければ探索
      if !@memo.has_key?(next_pattern)
        search(next_pattern, goal_pattern)
      end
      # ゴールからの移動距離をメモ化
      if !@memo.has_key?(pattern)
        @memo[pattern] = @memo[next_pattern] + length
      else
        @memo[pattern] = [@memo[pattern], @memo[next_pattern] + length].min
      end
    end
  end
  # 対称的なパターンもメモ化しておく
  symmetry(pattern).each do |pat|
    @memo[pat] = @memo[pattern]
  end
end

#
# パターンとゴールで色が等しい位置の個数を数える
#
def match_goal(pattern, goal_pattern)
  match = pattern & goal_pattern
  count = 0
  (@w*@h).times do
    count += 1 if match % 2 == 1
    match /= 2
  end
  return count
end

#
# 初期化
#
sets_length = (0...@w*@h).to_a.combination(@w*@h/2).to_a.length
@goal_patterns = make_goal_patterns()
@memo = {}
max_length = 0
max_pattern = []

#
# すべてのパターンで処理を行う
#
(0...@w*@h).to_a.combination(@w*@h/2) do |set|
  # パターンを生成
  pattern = 0
  set.each do |i|
    pattern += 1 << i
  end

  # すべてのゴールについて処理を行う
  @goal_patterns.each do |goal_pattern|
    # ゴールと同じ色の数が少ない場合は探索しない
    next if match_goal(pattern, goal_pattern) < @w*@h/4/2
    # ゴールまで探索
    search(pattern, goal_pattern)
  end

  # 移動回数の最大値を更新
  if max_length < @memo[pattern]
    #print "#{@memo[pattern]} #{@memo.length}/#{sets_length}\n"
    max_length = @memo[pattern]
    max_pattern = [pattern]
  elsif max_length == @memo[pattern]
    #print "#{@memo[pattern]} #{@memo.length}/#{sets_length}\n"
    max_pattern << pattern
  end
end
#p max_pattern
p max_pattern.length

# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"

exit

p checked_pattern.length
p (0...@width*@height).to_a.combination(@width*@height/2).to_a.length
exit

exit

def find_near_opposite_color(pattern, pos, goal_pattern)
  min_dis = Float::INFINITY
  min_poses = []
  x1, y1 = pos % @width, pos / @width
  (0...@width*@height).each do |i|
    next if i == pos
    next if pattern.include?(pos) == pattern.include?(i)
    next if goal_pattern.include?(i)
    x2, y2 = i % @width, i / @width
    dis = (x2 - x1).abs + (y2 - y1).abs
    if min_dis > dis
      min_dis = dis
      min_poses = [i]
    elsif min_dis == dis
      min_poses << i
    end
  end
  return min_poses, min_dis
end

def match_goal(pattern, goal_pattern)
  return (pattern & goal_pattern).length
end


@memo = {}

display(pattern)
goal_pattern = (0...@width*@height/2).to_a
display(goal_pattern)
total_dis = 0
patterns = [pattern]
#3.times do
#next_patterns = []
#patterns.each do |pattern|

@min_length = Float::INFINITY

def rotate180(pattern)
  rotate_pattern = []
  (0...@width*@height).each do |i|
    next if !pattern.include?(i)
    x, y = i % @width, i / @width 
    next_x = (@width  - 1) - x
    next_y = (@height - 1) - y
    next_pos = next_x + next_y * @width
    rotate_pattern << next_pos
  end
  return rotate_pattern.sort
end

def flip(pattern)
  flip_pattern = []
  (0...@width*@height).each do |i|
    next if !pattern.include?(i)
    x, y = i % @width, i / @width 
    next_x = (@width  - 1) - x
    next_y = y
    next_pos = next_x + next_y * @width
    flip_pattern << next_pos
  end
  return flip_pattern.sort
end

def symmetry(pattern)
  patterns = [pattern]
  patterns << rotate180(pattern)
  patterns << flip(pattern)
  patterns << rotate180(flip(pattern))
  
  return patterns
end

def invert(pattern)
  invert_pattern = []
  (0...@width*@height).each do |i|
    next if pattern.include?(i)
    invert_pattern << i
  end
  return invert_pattern
end

pattern = (1...8).to_a + [12]
#display(pattern)
#display(rotate180(pattern))
#display(flip(pattern))

symmetry(pattern).each do |pattern|
  display(pattern)
end

display(pattern)
display(invert(pattern))

#exit

def memo(pattern, goal_pattern, length)
  @memo[[pattern, goal_pattern]] = length
=begin
  @memo[[rotate180(pattern), rotate180(goal_pattern)]] = length
  @memo[[flip(pattern), flip(goal_pattern)]] = length
  @memo[[flip(rotate180(pattern)), flip(rotate180(goal_pattern))]] = length
 
  @memo[[invert(pattern), invert(goal_pattern)]] = length
  @memo[[invert(rotate180(pattern)), invert(rotate180(goal_pattern))]] = length
  @memo[[invert(flip(pattern)), invert(flip(goal_pattern))]] = length
  @memo[[invert(flip(rotate180(pattern))), invert(flip(rotate180(goal_pattern)))]] = length
=end  

end

@memo = {}
pattern = (2...8).to_a + [11, 13]
display(pattern)
goal_pattern = (0...8).to_a
display(goal_pattern)
memo(pattern, goal_pattern, 9)
p @memo
@memo.each do |key, value|
  puts "start"
  display(key[0])
  puts "goal"
  display(key[1])
end
#exit


def move(pattern, goal_pattern, move_length)
  return if move_length > @min_length
  if @memo.has_key?([pattern, goal_pattern]) && @memo[[pattern, goal_pattern]] <= move_length
    #puts "has key"
    return
  end
  
=begin
  symmetry(pattern).uniq.each do |p|
    @memo[p] = move_length
  end
  symmetry(invert(pattern)).uniq.each do |p|
    @memo[p] = move_length
  end
=end
  memo(pattern, goal_pattern, move_length)
  
  #display(pattern)
  if match_goal(pattern, goal_pattern) == @width*@height/2
    #puts "goal"
    #p move_length
    @min_length = [move_length, @min_length].min
    return
  end
  (0...@width*@height).each do |pos1|
  #  pos1 = 3
    next if !goal_pattern.include?(pos1) || pattern.include?(pos1)
    poses, dis = find_near_opposite_color(pattern,pos1, goal_pattern)
    #print "#{pos1} -> #{poses} dis:#{dis}\n"
    #start_pattern = pattern
    poses.each do |pos2|
      #p pos2
      next_pattern = swap(pattern.clone, pos1, pos2)
      next if match_goal(pattern, goal_pattern) > match_goal(next_pattern, goal_pattern)
      #next_patterns << next_pattern
      #display(pattern)
      move(next_pattern, goal_pattern, move_length + dis)  
    end
    #total_dis += dis
  end
end
#p next_patterns.length
#p next_patterns.uniq.length
#patterns = next_patterns.uniq
#end
#p total_dis

def make_goal_patterns()
  goal_patterns = []
  goal_patterns << (0...@width*@height/2).to_a
  goal_patterns << (@width*@height/2...@width*@height).to_a
  goal_patterns << (0...@width*@height).select{|i| i % @width < @width / 2} 
  goal_patterns << (0...@width*@height).select{|i| i % @width >= @width / 2} 
  
  return goal_patterns
end

@goal_patterns = make_goal_patterns()

#pattern = [2, 3, 6, 7, 10, 11, 14, 15]
pattern = [0, 1, 4, 6, 8, 9, 12, 13]
pattern = [2, 5, 8, 10, 11, 12, 13, 15]
pattern = [0, 1, 4, 6, 8, 9, 12, 13]

def find_shortest_length(pattern)
  @min_length = Float::INFINITY
  #display(pattern)
  @goal_patterns.each do |goal_pattern|
    #next if match_goal(pattern, goal_pattern) < @width*@height/4 - 1
    #display(pattern)
    #@memo = {}
    move(pattern, goal_pattern, 0) 
    #display(pattern)
    #display(goal_pattern)
  end
  return @min_length
end



max_length = 0
max_pattern = []
checked_pattern = []
@memo = {}
(0...@width*@height).to_a.combination(@width*@height/2) do |pattern|
  if max_pattern.include?(pattern)
    #puts "max_pattern"
  end
  if checked_pattern.include?(pattern)
    #puts "checked pattern"
    next
  end
  @memo = {}
  min_length = find_shortest_length(pattern)
  if max_length < min_length
    max_length = min_length
    max_pattern = symmetry(pattern) + symmetry(invert(pattern))
    max_pattern.uniq!
    p max_length
    display(pattern)
  elsif max_length == min_length
    #p symmetry(pattern)
    max_pattern += symmetry(pattern) + symmetry(invert(pattern))
    max_pattern.uniq!
    p max_length
    p max_pattern.length
    display(pattern)
  end
  checked_pattern += symmetry(pattern) + symmetry(invert(pattern))
  #checked_pattern.uniq!
end
p max_length
#p max_pattern
max_pattern.each do |pattern|
  #display(pattern)
end
p max_pattern.uniq.length



# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"

  
exit


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
