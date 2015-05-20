# @riverplus  Kawazoeさんからの数学の問題
# 「コモン・マルチプル」問題
# https://codeiq.jp/ace/kawazoe/q1382


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

require 'prime'

n = 50
ans = 1
(1..n).inject(:*).prime_division.each do |factor|
  ans *= 2 * factor[1] + 1
end
p (ans - 1) / 2 + 1


# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
