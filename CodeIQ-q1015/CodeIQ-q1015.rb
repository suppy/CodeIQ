# @cielavenir  cielさんからのアルゴリズムの問題
# モーニングクエスト：フィボナッチ数列
# https://codeiq.jp/ace/cielavenir/q1015

# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"


f_n = 0
f_n_1 = 1
f_n_2 = 1

i = 3
(3..100000000).each do |i|
	f_n = f_n_1 + f_n_2
	# p f_n
#	p i if i % 1000000 == 0
#	p i
#	break if i == 100000000
	f_n_1, f_n_2 = f_n % 1000000000, f_n_1
#	i += 1
end
p f_n %  1000000007


# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
