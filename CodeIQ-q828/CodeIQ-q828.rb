# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：シャッフルで逆順
# https://codeiq.jp/ace/thisweek_masuipeo/q828


#
# シャッフルするための再帰関数
# カードが逆順になり、シャッフル回数がこれまでより小さければ、
# シャッフル回数の最小値を更新して関数を抜ける 
#   引数
#     cards : カードの並びを格納した配列
#     k     : シャッフルした回数
#     cards_array: シャッフルしたあとのカードを格納する配列
#                  cards がこの配列に含まれていれば、すでにこの並びは登場していることになるので、
#                  関数を抜ける
#   戻り値:なし
#
def shuffle(cards, k, cards_array)

	return if k > $times # これまでのシャッフルの最小回数より大きくなったら関数を抜ける
	if cards == $reverse_order # 逆順になったとき
		p k
		p "reverse order!"
		# シャッフルした最小回数を更新して、関数を抜ける
		$times = k
		return
	end

	if cards_array.include?(cards) == true # これまでに登場した並びになったとき
		return # 関数を抜ける
	end
	# 登場したカードを配列に格納する
	cards_array << cards.clone
	# カードの塊を抜き出す位置を一つずつずらして次のシャッフルをする
	(1..$n).each do |i|
		# カードをシャッフルする
		cards_next = cards[i, $n] + cards[0, i] + cards[i + $n, 2 * $n]

		# シャッフルしたカードの並びで、次のシャッフルを行う関数を呼び出す
		shuffle(cards_next.clone, k+1, cards_array.clone)
	end
end


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"


# まとめて抜き出すカードの枚数
$n = 5

# 最初のカードの並びを配列 cards に設定
# [1, 2, 3, ... , 2*n]
cards = []
(1..(2*$n)).each do |i|
	cards << i
end

# 逆順のカードの並びを配列 $reverse_order に設定
# [2*n, ... , 3, 2, 1]
$reverse_order = cards.reverse

# 逆順になるまでのシャッフルの最小回数
# 初期値は $n*$n を設定
$times = $n*$n

# シャッフルしているときに登場するカードの並びを格納する配列
cards_array = []

# シャッフルを始める
shuffle(cards, 0, cards_array)

# シャッフルの回数の最小値が答え
print "answer = #{$times}\n"


# 処理終了時刻
t1 = Time.now
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
