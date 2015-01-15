# @riverplus  Kawazoeさんからの数学の問題
# 「ビリオン・ダラー」問題
# https://codeiq.jp/ace/kawazoe/q1168


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

require 'prime'

n = 10**9
n = 100
count = 0
#count = ((n/2).floor) * n - ((n/2).floor)**2
j = 2
while j <= n
  #print "j = #{j} \n"
  count += ((n/j).floor) * n
=begin
  (1..(n/j).floor).each do |i|
    count -= j * i - 1
  end
=end
  count -= j * ((n/j).floor) * (((n/j).floor)+1) / 2 - ((n/j).floor)
  j *= 2
end
p count
n = 100
p Prime.prime_division(n)
#n = 100
count = 0
2.step(n, 2) do |i|
  count += (n-(i-1))*Prime.prime_division(i)[0][1]
end
p count

n = 5
count_prev = 0
count = 0
(2..n).each do |i|
  count += count_prev
  count += Prime.prime_division(i)[0][1] if Prime.prime_division(i)[0][0] == 2
  count_prev += Prime.prime_division(i)[0][1] if Prime.prime_division(i)[0][0] == 2
  #print "#{i} #{count}\n"
end
p count


# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
