# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：いたずらされたお菓子？
# https://codeiq.jp/ace/thisweek_masuipeo/q1116


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

#@taste_num = 3
#@sweets_num = 2

#@taste_num = 4
#@sweets_num = 1


@taste_num = 5
@sweets_num = 6

# どのお菓子も包み紙と中身が不一致になる組の数
@count = 0

# 深さ優先探索
def search(sweets)
  # お菓子の組み合わせが見つかった場合
  if sweets.length == @taste_num * @sweets_num
    @count += 1
    return
  end
  (0...@taste_num).to_a.each do |taste|
    # ある味のお菓子の個数が規定数になっている場合
    next if sweets.count(taste.to_s) == @sweets_num
    # ある味のお菓子と包み紙が同じになる場合
    next if taste == sweets.length / @sweets_num
    search(sweets + taste.to_s)  
  end
end

search("")

p @count

# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"

exit

#sweets_set = [[]]
sweets_set = Hash.new()
sweets_set[""] = 1

#count = 0
#loop do
(taste_num * sweets_num).times do
  #p sweets_set.length
  #p sweets_set[sweets_set.length/2]
  # お菓子の並びが終われば
#  break if sweets_set[0].length == fruits_num * sweets_num
  sweets_set_next = {}
  sweets_set.each do |sweets_sub, value|
#    sweets_sub = sweets_s.split("")
    (0...taste_num).to_a.each do |taste|
      # ある味のお菓子の個数が用意した個数になっている場合は繰り返し
#      next if sweets_sub.count(taste) == sweets_num
      next if sweets_sub.count(taste.to_s) == sweets_num
      # ある味のお菓子と包み紙が同じ場合は繰り返し
      next if taste == sweets_sub.length / sweets_num
#      sweets_sub1 = sweets_sub.clone
#      sweets_sub1 << sweet
#      sweets_set_next << (sweets_sub.clone << taste)
      sweets_set_next[sweets_sub + taste.to_s] = 1
      #count += 1
    end
  end
  sweets_set = sweets_set_next
  p sweets_set.length
  sweets_set.each do |sweets_sub, value|
    p sweets_sub
    break
  end
end
#p count
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
