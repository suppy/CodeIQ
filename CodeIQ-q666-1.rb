# 指定した位置に飛車と角を置いたときのマス目を数える
# 飛車の位置: (x_h, y_h)
# 角　の位置: (x_k, y_k)
def count_square(x_h, y_h, x_k, y_k)
	board = Array.new(9 * 9, 0)

	board_h = board.clone
	# 飛車を置いたときの盤面の状態（角の位置も考慮）を配列 board_h に格納する
	#   要素　　1:利きのマス 0:利きではない
	square_h(board_h, x_h, y_h, x_k, y_k)
	
	board_k = board.clone
	# 角を置いたときの盤面の状態（飛車の位置も考慮）を配列 board_k に格納する
	#   要素　　1:利きのマス 0:利きではない
	square_k(board_k, x_k, y_k, x_h, y_h)

	# 飛車と角の利きの盤面を重ね合わせ、配列 board_hk に格納する
	board_hk = []
	loop do
		board_hk << (board_h.shift | board_k.shift)
		if board_h.size == 0
			break
		end
	end

	# 利きのマス目を数える
	num = board_hk.count(1)
	return num	

end

# 飛車を置いたときの盤面の状態（角の位置も考慮）を配列 board_h に格納する
def square_h(board_h, x_h, y_h, x_k, y_k)

	# 十字の各方向の利きを調べる
	# 利きの場合は、board_hの要素を1にする
	# 角が置かれているマスから先は調べない
	# [右、左、下、上]
	[[1, 0], [-1, 0], [0, 1], [0, -1]].each do |move|
		dx = move[0]
		dy = move[1]
		x = x_h
		y = y_h
		loop do
			x += dx
			y += dy
			if x < 0 || x >= 9 || y < 0 || y >= 9 || (x == x_k && y == y_k)
				break
			end
			board_h[x + y * 9] = 1
		end
	end
end

# 角を置いたときの盤面の状態（飛車の位置も考慮）を配列 board_k に格納する
def square_k(board_k, x_k, y_k, x_h, y_h)
	# ×の各方向の利きを調べる
	# 利きの場合は、board_kの要素を1にする
	# 飛車が置かれているマスから先は調べない
	# [右下、右上、左下、左上]
	[[1, 1], [1, -1], [-1, 1], [-1, -1]].each do |move|
		dx = move[0]
		dy = move[1]
		x = x_k
		y = y_k
		loop do
			x += dx
			y += dy
			if x < 0 || x >= 9 || y < 0 || y >= 9 || (x == x_h && y == y_h)
				break
			end
			board_k[x + y * 9] = 1
		end
	end
end

# 盤面を表示する（テスト用）
def print_board(board)
	(0...9).each do |j|
		(0...9).each do |i|
			print board[i + j * 9]
		end
		print "\n"
	end
end

# 例の解答と同じかどうかのテスト
#p count_square(2, 2, 6, 2)
#p count_square(2, 2, 5, 2)
#p count_square(0, 0, 8, 8)
#p count_square(0, 0, 1, 0)



# 飛車と角を配置する、すべての位置での利きのマス目の合計 num を求める
num = 0
(0...9).each do |l|
	(0...9).each do |k|
		# 角　の位置: (k, l)
		(0...9).each do |j|
			(0...9).each do |i|
				# 飛車の位置: (i, j)
				# 飛車と角の位置が同じであれば、次の繰り返しを行う
				if i == k && j == l
					next
				end
				num += count_square(i, j, k, l)
			end
		end
	end
end

# 合計を表示する
p num