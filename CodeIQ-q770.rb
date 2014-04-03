# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：「白」で埋め尽くせ！
# https://codeiq.jp/ace/thisweek_masuipeo/q770

# 考え方
#
# すべて白の盤のパターンからスタートし、
# 反転した後の盤のパターンを、すべての盤のパターンの集合の中から削除する
# 反転の操作を続けていき、すべての盤のパターンが出現したときの回数が
# 最大の回数になる



# 盤のサイズ
SIZE = 4

# 盤の状態を文字列で表す
# r行目、c列目 -> (r-1) * SIZE + (c-1) 番目の文字
# 2進数の表現で扱うことができる
# 0:□（白）
# 1:■（黒）
# board = "0000000000000000"
board = ""

# 盤の初期化
# すべて白にする
def init_board(board)
	board = "0" * SIZE * SIZE

	return board
end

# 盤の表示
def print_board(board)
	(0...SIZE).each do |j|
		(0...SIZE).each do |i|
			case board[j * SIZE + i]
			when "0"
				print "□"
			when "1"
				print "■"
			else
				print "・"
			end
		end
		print "\n"
	end
	print "\n"
end

# r行目、c列目を反転させる
def invert_board(board, r, c)
	# 反転を表すハッシュ
	wb = {"1" => "0", "0" => "1"}
	# c列を反転
	(0...SIZE).each do |j|
		board[j * SIZE + c-1] = wb[board[j * SIZE + c-1]]
	end
	# r行を反転
	(0...SIZE).each do |i|
		board[(r-1) * SIZE + i] = wb[board[(r-1) * SIZE + i]]
	end
	# r行c列のマス目は 2度反転しているので、もう一度反転させる
	board[(r-1) * SIZE + c-1] = wb[board[(r-1) * SIZE + c-1]]
	
	return board
end



# 盤を初期化（すべて白にする）
board = init_board(board)

# すべての盤のパターンを格納する配列
all_pattern = []
# すべての盤のパターンを格納する
(0..(2 ** (SIZE * SIZE))-1).each do |i|
	all_pattern << ("0" * SIZE * SIZE + i.to_s(2))[-(SIZE * SIZE), SIZE * SIZE]
end

# n回目の反転後の盤のパターンを格納する配列
appeared_board_pattern = []
# 初期値（すべて白）のパターンを格納する
appeared_board_pattern << init_board(board)

# すべての盤のパターンから、初期値のパターンを削除する
all_pattern.delete(init_board(board))

n = 1
loop do
	print "#{n}回目の反転\n"
	# 反転後の盤のパターンを格納する配列
	invert_board_pattern = []
	# n-1回目の反転後の盤のパターンそれぞれについて、n回目の反転後の盤のパターンを求める
	# ただし、この appeared_board_pattern の配列には、
	# これまでの反転の操作で現れた盤のパターンは含まれていない
	appeared_board_pattern.each do |board|
		# 盤上の i行 j列を反転させた後の盤面を配列 invert_board_patternに格納する
		(1..SIZE).each do |i|
			(1..SIZE).each do |j|
				current_board = board.clone
				next_board = invert_board(current_board, i, j)
				invert_board_pattern << next_board
			end
		end	
	end

	# 反転後の盤のパターンの配列から、重複するパターンを削除する
	invert_board_pattern.uniq!
	# n回目の反転後の盤のパターンの配列を、n+1回目の反転前の盤のパターンの配列に設定する
	appeared_board_pattern = invert_board_pattern.clone
	# 反転後の盤のパターンそれぞれについて以下の処理を行う
	invert_board_pattern.each do |board|
		# すべての盤のパターンの配列に、反転後のパターンが存在する場合、
		# これまでの反転の操作で現れていない盤のパターンなので、
		# すべての盤のパターンの配列から、盤のパターンを削除する
		if all_pattern.include?(board)
			all_pattern.delete(board)
			# すべての盤のパターンが現れた場合
			if all_pattern.length == 0
				# 最後に残った盤のパターンを表示する
				print "反転作業を行うステップ数が最大になる初期状態\n"
				print_board(board)
				# 処理終了
				exit	
			end
		# これまでの反転の操作で現れている盤のパターンなので、
		# 次の反転の操作で使用する盤のパターンの配列から、盤のパターンを削除する
		else
			appeared_board_pattern.delete(board)	
		end
	end
	print "出現していないパターン数 #{all_pattern.length}\n\n"
	n += 1
end
