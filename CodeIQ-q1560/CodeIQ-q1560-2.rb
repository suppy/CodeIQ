# @riverplus  Kawazoeさんからの問題
# 「フィズ・バズ・エクストリーム」問題
# https://codeiq.jp/q/1560


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

factor = [3, 5]
n = 20
n = 100

# Problem1
#factor = [3, 5, 7, 11, 13, 17, 19, 23, 29, 31]
#n = 10 ** 5

# Problem2
factor = [3, 5, 7, 11, 13, 17, 19, 23, 29, 31]
#n = 10 ** 9
numbers = []
(2..n).each do |i|
  factor.each do |j|
    if i % j == 0
      numbers << i
      print i, " "
      break
    end
  end
end
puts numbers.uniq.inject(:+)

require 'prime'

ans = 0
ans += n * (n + 1) / 2 - 1
(1..(Math.log2(n).floor)).each do |i|
  ans -= 2 ** i
end
puts ans
(32..n).each do |i|
  (0..Math.log2(i)).each do |j|
    if (i / (2 ** j)) != 0 && (i / (2 ** j)).prime?
      ans -= i
      print i, " ", (i / (2 ** j)), " "
      break
    end
  end
end
puts ans

# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
