#coding: utf-8

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
end

def find_near_goal(pattern)
  count1 = 0
  goal_pattern1 = (0..(@width*@height/2-1)).to_a
  #display(goal_pattern1)
  (0...@width*@height).each do |i|
    count1 += 1 if pattern.include?(i) && goal_pattern1.include?(i)
  end
  #p count1
  count2 = 0
  goal_pattern2 = (0...@width*@height).select{|i| i % @width < @width / 2} 
  #p goal_pattern2  
  #display(goal_pattern2)
  (0...@width*@height).each do |i|
    count2 += 1 if pattern.include?(i) && goal_pattern2.include?(i)
  end
  #p count2
  return goal_pattern1 if count1 > count2
  return goal_pattern2
end

@hash_pattern = Hash.new(0)
#p find_near_goal((0...8).to_a)
@max_count = 0
def search(pattern, goal_pattern, count)
  #p pattern
  #p goal_pattern
  print "#{count} #{pattern.sort}\n"
  #if count >= 160
  #  exit
  #end
  if pattern.sort == goal_pattern
    puts "goal"
    if @max_count < count
      @max_count = count
    end
    p @max_count
    exit
    return
  end
  (0...@width*@height).each do |i|
    #p i
    #if !pattern.include?(i) && goal_pattern.include?(i)
    if !pattern.include?(i)# && goal_pattern.include?(i)
      #p i
      [-1, @width, 1, -@width].each do |dir|
        next if dir == -1 && i % @width == 0
        next if dir == 1  && i % @width == @width - 1
        next if i + dir < 0 || i + dir >= @width*@height
        #next if !goal_pattern.include?(i + dir)
        #print "#{i} #{dir} #{i+dir} #{count+1} #{pattern.sort}\n"
        next if !pattern.include?(i + dir)
        next_pattern = pattern.clone
        next_pattern = next_pattern + [i] - [i + dir]
        next if next_pattern.uniq.length != @width*@height/2
        next if @hash_pattern[next_pattern.sort] != 0
        #print "#{i} #{dir} #{count+1} #{next_pattern.sort}\n"
        #p next_pattern.sort
        @hash_pattern[next_pattern.sort] = 1
        #print "hash #{next_pattern.sort}\n"
        #p @hash_pattern.length
        search(next_pattern, goal_pattern, count + 1)
      end
    end
  end
  
end

#pattern = (1...8).to_a + [10]
pattern = (1..6).to_a + [10, 12]
#pattern = [1, 3, 5, 7, 9, 11, 13, 15]
p pattern
display(pattern)
@hash_pattern[pattern] = 1
goal_pattern = find_near_goal(pattern)
p goal_pattern

search(pattern, goal_pattern,0)
p pattern
p goal_pattern
p @max_count
exit

(1...@width*@height).to_a.combination(@width*@height/2-1) do |set|
  p pattern = [0] + set
  display(pattern)
  goal_pattern = find_near_goal(pattern)
  puts "goal_pattern"
  display(goal_pattern)
  (0...@width*@height).each do |i|
    
  end
end
