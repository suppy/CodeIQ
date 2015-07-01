# @riverplus  Kawazoeさんからの問題
# 「フィズ・バズ・エクストリーム」問題
# https://codeiq.jp/q/1560


# start time
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

items = [3, 5]
@n = 20
@n = 1000
items = [3, 5, 7, 11, 13, 17, 19, 23, 29, 31]
@n = 1000
@n = 10 ** 5
@n = 10 ** 9

# @n 以下の a の倍数の和を返す
def F(a)
  num = (@n / a).floor # @n までの項数
  (a + (@n - @n % a)) * num / 2
end

# 包除原理
sum = 0
sgn = 1
(1..items.length).each do |i|
  items.combination(i) do |set|
    sum += sgn * F(set.inject(:*))
  end
  sgn = -sgn
end
p sum

# end time
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# processing time
puts "処理時間：#{t1 - t0} sec"
