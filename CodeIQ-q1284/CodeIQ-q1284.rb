# @riverplus  Kawazoeさんからの数学の問題
# 「パワー・オブ・フィボナッチ」問題
# https://codeiq.jp/ace/kawazoe/q1284


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"


n = 1000000

pow_fibo = []
pow_fibo[0] = 1
pow_fibo[1] = 3
(2..n).each do |i|
	pow_fibo[i] = (pow_fibo[i-2] * pow_fibo[i-1]) % 1000000
end
p pow_fibo[n]


# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
