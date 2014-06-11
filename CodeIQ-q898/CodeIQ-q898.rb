# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：同じ大きさに分割
# https://codeiq.jp/ace/thisweek_masuipeo/q898

# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

#
# すべて縦・横でつながっているマスの数が１０であるかを判定する関数
#  引数
#   pattern:同じ色となっているマスの番号が格納された配列（ただし、マスの位置は一次元で表現している）
#   pos     :マスの位置（ただし、一次元で表現している）　
#   check_point:これまでに、つながっているか判定した位置を格納した配列
#  戻り値
#   true  :つながったマスの数が１０
#   false :上記以外
#
#  マスの位置
#	  □□□□□
#     □□■□□
#	  □□□□□
#	  □□□□□
#    上記の場合、二次元座標では、(x, y) = (2, 1)として定義し、
#	　一次元では、x + y * 5で変換して、7 を一次元での位置として表す
#
def check_neighbor(pattern, pos, check_point)
	# 上方向のマスをチェック
	# 最上段ではない　　　同じ色のマス　　　　　　　　　　　　　　これまでにチェックしていない
	if pos - 5 >= 0 && pattern.include?(pos - 5) && !check_point.include?(pos - 5)
		# 上のマスを、判定したマスの配列に追加する
		check_point << pos-5 
		# 上のマスに移動して判定する
		check_neighbor(pattern, pos - 5, check_point) 
	end

	# 右方向のマスをチェック
	# 右端ではない　　　右下ではない　　　　同じ色のマス　　　　　　　　　　　　　　これまでにチェックしていない
	if pos % 5 != 4 && pos + 1 < 20 && pattern.include?(pos + 1) && !check_point.include?(pos + 1)
		# 右のマスを、判定したマスの配列に追加する
		check_point << pos + 1
		check_neighbor(pattern, pos + 1, check_point)
	end
	
	# 下方向のマスをチェック
	# 最下段ではない　　　同じ色のマス　　　　　　　　　　　　　　これまでにチェックしていない
	if pos + 5 < 20 && pattern.include?(pos + 5) && !check_point.include?(pos + 5)
		# 下のマスを、判定したマスの配列に追加する
		check_point << pos + 5
		check_neighbor(pattern, pos + 5, check_point)
	end
	
	# 左方向
	# 左端ではない　　　左上ではない　　　　同じ色のマス　　　　　　　　　　　　　　これまでにチェックしていない
	if pos % 5 != 0 && pos - 1 >= 0 && pattern.include?(pos - 1) && !check_point.include?(pos - 1)
		# 左のマスを、判定したマスの配列に追加する
		check_point << pos - 1
		check_neighbor(pattern, pos - 1, check_point)
	end

	# つながっているマスが10個であれば、true
	if check_point.length == 10
		return true
	else
		return false
	end
end


# 分割方法の個数
num = 0
# 20個のマスのうち、10個を選ぶときのすべてのパターンについて処理を行う
(0...20).to_a.combination(10).to_a.each do |pattern|
	# 左上をスタート地点に設定
	check_point = [pattern[0]]
	# 指定した分割方法のパターンになっていればカウント
	num += 1 if check_neighbor(pattern, pattern[0], check_point) == true
end
p num

# 処理終了時刻
t1 = Time.now
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"

exit

allPattern10 = (0...20).to_a.combination(10).to_a
pattern = allPattern10[0112000]
p pattern
(0...20).each do |i|
	if pattern.include?(i)
		print "■"
	else
		print "　"
	end
	if i % 5 == 4
		print "\n"
	end
end

patterns = []

pattern = [0, 0, 0, 0, 0,
		   0, 0, 0, 0, 1,
		   0, 0, 1, 1, 1,
		   0, 0, 1, 0, 1]

def count_black(pattern)
	count = 0
	(0...5).each do |x|
		(0...5).each do |y|
			count += 1 if pattern[x + y * 5] == 1
		end
	end
	return count
end		   

p count_black(pattern)
		   
def check_divide(pattern)
	direction = [[-1, 0], [0, -5], [1, 0], [0, 5]]
	count = 0
	(0...5).each do |x|
		(0...5).each do |y|
			check_divide = false
			direction.each do |d|
				if pattern[x + y * 5] == pattern[x + d[0] + y * 5 + d[1]]
					check_divide = true
					break
				end
			end
			if check_divide == true
				count += 1
			end
		end
	end
	return false if count == 25
	return true
end

p check_divide(pattern)

def next_pattern(x, y, pattern)
	# 上
	pattern[x+(y-1)*5] = 1 
	patterns << pattern if count_black(pattern) == 10
	# 右
	
	# 下
	
	# 左
	
end		   

next_pattern(1, 1, pattern)
p patterns 