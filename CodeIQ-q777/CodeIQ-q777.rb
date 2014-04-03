# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：並べ替えの繰り返し
# https://codeiq.jp/ace/thisweek_masuipeo/q777

#
# 1枚目のカードのラベルが k のとき、最初の k 枚のカードを逆順にする
#
def reverse_card(card)
	k = card[0].to_i
	return card[0, k].reverse + card[k, card.length - k]
end

#
# カードが変化しなくなるまでの回数を数える
#
def count_reverse_times(card)
	if card[0] == "1" # 先頭のカードが 1 の場合
		return 0 # これ以上は変化しない
	else
		return 1 + count_reverse_times(reverse_card(card))
	end

end

=begin
card = "362154"
print count_reverse_times(card)
=end


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"
 
max_times = 0 # カードを逆順にした回数の最大値
max_card = [] # 最大値になるカードの並び
 
# １枚目
(1..9).each do |i|
	# １枚目のラベルが 1 であれば、カードが変化しなくなる
	next if i == 1
	# ２枚目
	(1..9).each do |j|
		# カードが重複しないようにする
		next if j == i
		# ３枚目
		(1..9).each do |k|
			# カードが重複しないようにする
			next if k == i or k == j
			# ４枚目
			(1..9).each do |l|
				# カードが重複しないようにする
				next if l == i or l == j or l == k
				# ５枚目
				(1..9).each do |m|
					# カードが重複しないようにする
					next if m == i or m == j or m == k or m == l
					# ６枚目
					(1..9).each do |n|
						# カードが重複しないようにする
						next if n == i or n == j or n == k or n == l or n == m
						# ７枚目
						(1..9).each do |o|
							# カードが重複しないようにする
							next if o == i or o == j or o == k or o == l or o == m or o == n
							# ８枚目
							(1..9).each do |p|
								# カードが重複しないようにする
								next if p == i or p == j or p == k or p == l or p == m or p == n or p == o
								# ９枚目
								(1..9).each do |q|
									# カードが重複しないようにする
									next if q == i or q == j or q == k or q == l or q == m or q == n or q == o or q == p
									# カードの並びを生成
									card = i.to_s + j.to_s + k.to_s + l.to_s + m.to_s + n.to_s + o.to_s + p.to_s + q.to_s
									# カードが変化しなくなるまでの回数を数える
									reverse_times = count_reverse_times(card)
									# これまでの最大値の場合
									if reverse_times > max_times
										# 最大値を更新
										max_times = reverse_times
										# 最大値になるカードの並びの配列を更新
										max_card = []
										max_card << card
									 # これまでの最大値と等しい場合
									elsif reverse_times == max_times
										# 最大値になるカードの並びを配列に追加
										max_card << card
									end
								end
							end
						end
					end
				end
			end
		end
	end
end

print "最大回数：#{max_times}\n"
print "カードの並びのパターン数：#{max_card.length}\n"
print "カードの並びのパターン："
max_card.each do |card|
	print "#{card}\n"
end
print "\n"
print "カードの変化\n"
max_card.each do |card|
	print "#{card}\n"
	loop do
		card = reverse_card(card)
		print "#{card}\n"
		if card[0] == "1"
			break
		end
	end
	print "\n"
end

# 処理終了時刻
t1 = Time.now
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
 
