# Short Coder @ozy4dm  Ozy@彦星さんからのアルゴリズムの問題
# 七夕問題☆牽牛 彦星 牛を飼う
# https://codeiq.jp/ace/ozy_hikoboshi/q959

# 牛舎のサイズ
n = 40

# 彦星の座標
hikoboshi_x, hikoboshi_y = 1, 1

# 牛舎を表す配列
# 配列に格納されている数値は以下を表す
#  0:何も置かれていない
#  1:彦星
#  2:ウシ
#  3:エサが届かない
gyusha = Array.new((n + 2) * (n + 2), 0)
gyusha[hikoboshi_x + hikoboshi_y * n] = 1

# 牛舎のすべての座標について処理を行う
(1..n).each do |y|
	(1..n).each do |x|
		# 何か値が設定されている場合
		next if gyusha[x + y * n] != 0
		# ウシを配置する
		gyusha[x + y * n] = 2
		# 彦星との相対位置を算出する
		diff_x = x - hikoboshi_x
		diff_y = y - hikoboshi_y
		# 彦星と、配置したウシを結ぶ直線の延長線上の位置はエサが届かない
		# 処理を繰り返す
		(1..n).each do |i|
			# 彦星と、配置したウシを結ぶ直線の延長線上の位置を算出
			x_1 = x + diff_x * i
			y_1 = y + diff_y * i
			# 牛舎をはみ出さない位置の場合
			if x_1 <= n && y_1 <= n
				# エサが届かない
				gyusha[x_1 + y_1 * n] = 3
			else
				break
			end
		end
	end
end

p n

# ウシをカウント
p gyusha.count(2)

#exit

(1..n).each do |y|
	(1..n).each do |x|
		print " " if gyusha[x + y * n] == 3
		print "*" if gyusha[x + y * n] == 2
		print "H" if gyusha[x + y * n] == 1
	end
	print "\n"
end
