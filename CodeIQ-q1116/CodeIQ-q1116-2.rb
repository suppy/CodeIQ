# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：いたずらされたお菓子？
# https://codeiq.jp/ace/thisweek_masuipeo/q1116


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

fruits_num = 3
sweets_num = 2

sweets = []
(0...fruits_num).each do |i|
  (0...sweets_num).each do |j|
    sweets << i
  end
end
p sweets
p sweets.length

sweets_set = [[]]
=begin
sweets.each do |sweet|
  sweets_set << [sweet] 
end
=end
count = 0
#(fruits_num * sweets_num).times do
#while sweets_set[0].length != fruits_num * sweets_num
#2.times do
loop do
  puts "loop"
  p sweets_set.length
  p sweets_set[sweets_set.length/2]
  break if sweets_set[0].length == fruits_num * sweets_num
  sweets_set_next = []
  sweets_set.each do |sweets_sub|
    #p sweets - sweets_sub
=begin
    sweets_rest = sweets.clone
    #p sweets_sub
    sweets_sub.each do |sweet|
      sweets_rest.delete_at(sweets_rest.find_index(sweet))
      #print "rest #{sweets_rest}\n"
    end
    #(sweets - sweets_sub).each do |sweet|
    #print "rest #{sweets_rest}\n"
#    sweets_rest.each do |sweet|
#    sweets_rest.uniq.each do |sweet|
=end
    (0...fruits_num).to_a.each do |sweet|
      next if sweets_sub.count(sweet) == sweets_num
      next if sweet == sweets_sub.length / sweets_num
      sweets_sub1 = sweets_sub.clone
      sweets_sub1 << sweet
      #p sweets_sub1
      #next if sweets_set_next.include?(sweets_sub1)
      #p sweets_sub1
      #if sweets_sub1[-1] != (sweets_sub1.length - 1) / sweets_num
        count += 1
        sweets_set_next << sweets_sub1
        #p sweets_set_next
      #end
    end
    
  end
  #p sweets_set_next
  sweets_set = sweets_set_next
  #p sweets_set.length
  #p sweets_set
end
p count
p sweets_set.length
exit



sweets_set.uniq!
p sweets_set


exit


s = []
sweets.each do |sweet|
  s << sweet 
  if s[-1] = s.length / sweets_num
  
  end
end


sweets_set = sweets.permutation(fruits_num * sweets_num).to_a.uniq
#p sweets_set
p sweets_set.length

count = 0
sweets_set.each do |sweets|
  match = false
  sweets.each_index do |idx|
    if sweets[idx] == idx / sweets_num
      match = true
      break
    end
  end
  count += 1 if !match
  #p sweets if !match
end
p count

# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"