# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：あみだくじの横線
# https://codeiq.jp/ace/thisweek_masuipeo/q838

# 使用する数字を配列 numbers に文字として格納する
numbers = "1234567".split('')
# p numbers

# 与えられた数字で順列を作成する
# すべての順列を配列 series に格納する
# ただし、順列は文字列にする（"1234", "3421" など）
series = numbers.permutation.collect {|num| num.join}

count = 0 # 求めるパターンの個数

# 個々の順列でバブルソートを行う
# 要素を交換した回数が、あみだくじの横線の数になる
series.each do |num|
	swap = 0
	# print num
	(num.length-1).times do
		(0...num.length-1).each do |j|
			if num[j].to_i > num[j+1].to_i
				num[j], num[j+1] = num[j+1], num[j]
				swap += 1
			end
		end
	end
	# print "->#{num}:#{swap}\n" 
	count += 1 if swap == 10 # 交換した回数が 10 回、すなわち、あみだくじの横線が 10 本の場合はカウントアップ
end
p count # パターンの個数を表示
