#　増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
#　今週のお題：排他的論理和で作る三角形
#　12月10日（水）AM10:00まで


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

def xor(x, y)
  return 0 if x == y
  return 1
end

count = 0
pascal = [1]
pascal = [1, 1]
loop do
  next_pascal = [1]
  (0...pascal.length-1).each do |i|
    next_pascal << xor(pascal[i], pascal[i+1])
  end
  next_pascal << 1
  pascal = next_pascal
  count += pascal.count(0)
  break if count >= 2014
end
p pascal.length

# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
