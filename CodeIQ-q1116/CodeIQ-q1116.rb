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
