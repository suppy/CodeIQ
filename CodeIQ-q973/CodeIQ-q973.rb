# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：ソートの交換回数を合計
# https://codeiq.jp/ace/thisweek_masuipeo/q973

# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

# 数字の個数
n = 7

# 求める交換回数
count = 0
(1..n).to_a.permutation(n).to_a.each do |pattern|
	# 配列の要素と位置が異なっていれば、
	# 配列の要素と位置が同じになるように要素を交換する
	# ただし、配列の位置は 0 から始まるので、 1 の加減算をしている
	(1..n).each do |i|
		index = pattern.index(i) + 1
		if index != i
			pattern[i-1], pattern[index-1] = pattern[index-1], pattern[i-1]
			count += 1
		end		
	end
end
p count





print "\n"

# 処理終了時刻
t1 = Time.now
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
