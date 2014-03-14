# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：サイコロの反転
# https://codeiq.jp/ace/thisweek_masuipeo/q735


# 次の状態のサイコロの目の並びを求める
#  dices:現在のサイコロの目の並びを表す整数
#  返り値：次の状態のサイコロの目の並びを表す整数
def next_dices(dices)
	dices = dices.to_s
	n = dices[0].to_i # １個目のサイコロの目
	sub_dices = dices.slice!(0, n) # １個目のサイコロの目の個数分、サイコロの目を取り出す
	(0...sub_dices.length).each do |i|
		dices += (7 - sub_dices[i].to_i).to_s # サイコロの目を裏返して後ろにつける
	end
	
	return dices.to_i
end


arr = [] # ループに入らない目を格納する配列
(111111..666666).each do |dices|
	next if dices.to_s =~ /[7890]/ # サイコロの目に 7890の文字が含まれていた場合

	# dices_array[i]
	# サイコロの目 iが作業中に何度登場したかを表す配列
	#      0：登場していない
	#      1：１度登場した
	#      2：ループの中に入っている
	#      3：ループを２周した
	# 初期化
	dices_array = Array.new(666666 + 1, 0)
	
	dices_array[dices] += 1 # サイコロの目の登場回数をインクリメント
	loop do
		dices = next_dices(dices) # サイコロをルールに従って動かす
		dices_array[dices] += 1 # サイコロの目の登場回数をインクリメント
		break if dices_array[dices] == 3 # ループを２周した場合
	end
	count = dices_array.count(1) # ループの中に入らない目の個数
	
	if count > 0
		# arrに、ループの中に入らない目を格納する
		count.times do
			arr << dices_array.index(1) # ループに入っていない目（要素が 1になっている位置）を arrに格納
			dices_array[dices_array.index(1)] = 0 # 次のループに入っていない目を求めるため、今の要素を 0にする
		end
	end
end

p arr.uniq.length # ループに入らない目の個数（重複なし）
