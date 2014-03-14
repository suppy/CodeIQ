# Short Coder @ozy4dm  Ozyさんからの言語不問の問題
# コード美人
# https://codeiq.jp/ace/ozy4dm/q723

# Ruby（ideone.comで実行）

# 数列を計算し、配列に格納する
# 数列の個数が指定した個数に達した場合は、数列を表示して処理を終了する
# 　　n    :3の倍数
# 　　max  :計算したい数列の個数
# 　　array:これまでに計算した数列が格納されている配列
def f(n, max, array)

	array2 = array.clone # 配列をコピー。この配列に数列を追加する
	array2 << n # nを配列に追加する
	array.each do |element|
		array2 << element + n # これまでの数列の要素に、nを足したものを配列に追加する
		if array2.length == max # 指定した個数に達した場合
			# 数列を表示
			array2.each do |i|
				p i
			end
			exit
		end
	end
	
	# 次の 3の倍数での数列を計算する
	f(n * 3, max, array2)
end

# 初項：1
# 表示を打ち切る個数：100
# 数列を格納する配列：空
f(1, 100, [])
