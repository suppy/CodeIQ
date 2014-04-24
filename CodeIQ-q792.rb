# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：（改造版）コラッツの予想
# https://codeiq.jp/ace/thisweek_masuipeo/q792

# 「最初の数」に戻る「最初の数」を格納する配列
return_initial = []

# 10000以下の偶数
2.step(10000, 2) do |n|
	# 数列を格納する配列
	series = []
	# 初期値を格納
	series << n
	# 初回のみ nに 3をかけて 1を足す
	n = n * 3 + 1

	# nが数列の中のこれまでの数値に含まれるまで繰り返す
	loop do
		# nが偶数の場合、nを 2で割る
		if n % 2 == 0
			n = n / 2
		# nが奇数の場合、nに 3をかけて 1を足す
		else
			n = n * 3 + 1
		end
		# nが「最初の数」に戻った場合
		if series[0] == n
			return_initial << n
			break
		# nが数列の中のこれまでの数値に含まれている場合
		# 「最初の数」には戻らず、繰り返す
		elsif series.include?(n)
			break
		else
			# 数列を格納する配列に nを格納する
			series << n
		end
	end
end

print "「最初の数」に戻る数の個数：#{return_initial.length}\n"
print "「最初の数」に戻る数\n"
return_initial.each do |i|
	print "#{i} "
end
