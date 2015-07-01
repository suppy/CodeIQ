# @riverplus  Kawazoeさんからの問題
# 「フィズ・バズ・エクストリーム」問題
# https://codeiq.jp/q/1560


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

factor = [3, 5]
n = 20
n = 1000

# Problem1
#factor = [3, 5, 7, 11, 13, 17, 19, 23, 29, 31]
#n = 10 ** 5

# Problem2
factor = [3, 5, 7, 11, 13, 17, 19, 23, 29, 31]
n = 10 ** 5
n = 10 ** 9
sum = 0
(2..n).each do |i|
  factor.each do |j|
    if i % j == 0
      sum += i
      break
    end
  end
end
p sum




# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"

__END__
処理開始時刻：2015-06-10 08:31:01 +0900

347147851533059033

処理終了時刻：2015-06-10 08:49:30 +0900
処理時間：1108.386474 sec
