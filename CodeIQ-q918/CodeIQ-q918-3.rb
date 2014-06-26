# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：交差せずに一筆書き
# https://codeiq.jp/ace/thisweek_masuipeo/q918


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

#
#　点(point)に番号を付ける
#
#      0─ 1─ 2─ 3─ 4
#      │  │  │  │  │
#      5─ 6─ 7─ 8─ 9
#      │  │  │  │  │
#     10─11─12─13─14
#      │  │  │  │  │
#     15─16─17─18─19
#
#　点の番号とその点に縦と横の隣り合う点の番号を対応付ける
#　　例
#　　　point[6] = [1, 7, 11, 5] 上、右、下、左の順
#               隣り合う点がない場合は、-1を設定する

# 対応付けの配列を作成する
@points = []
(0...4).each do |y|
	(0...5).each do |x|
		point = []
		if y == 0 # 上なし
			point << -1
		else
			point << x + y * 5 - 5
		end

		if x == 0 # 左なし
			point << -1
		else
			point << x + y * 5 - 1
		end

		if y == 3 # 下なし
			point << -1
		else
			point << x + y * 5 + 5
		end

		if x == 4 # 右なし
			point << -1
		else
			point << x + y * 5 + 1
		end
		@points << point
	end
end
# p @points

#
# 一筆書きできる点列を再帰的に求める関数
#  i: 点の番号
#  route: これまでに通ってきた点の番号を格納した配列
#
def search_hitofude(i, route)
	# すべての点を通ってきた場合は、点の番号を格納した配列routeを、
	# 一筆書きできたパターンを格納した配列@routesに格納して関数を抜ける
	if route.length == 20
		@routes << route
		return
	end
	# 点iと隣り合うすべての点について処理を行う
	@points[i].each do |j|
	
		route_next = route.clone
		# 隣り合う点がある、かつ、これまでに通ってきていない場合
		if j != -1 && !route_next.include?(j)
			# 点jを一筆書きの点に追加する
			route_next << j
			# 次の一筆書きの点を求めるために関数を呼ぶ
			search_hitofude(j, route_next)
		end
	end
end

# 一筆書きできるすべてのパターンを格納する配列を初期化
@routes = []
# すべての点について処理を行う
(0...@points.length).each do |i|
	# 点iを始点に設定する
	route = [i]
	# 一筆書きを求めるために関数を呼ぶ
	search_hitofude(i, route)
end

# 回答を出力する
# ただし、始点と終点が逆なだけで同じ位置、同じ形である場合は1つと数えるので
# 2で割る
p @routes.length / 2

exit

# 一筆書きとなる条件
#  すべての交点について、交点に接続する線分の数が２であること。
#  ただし、この問題では、始点と終点が重なる場合は除外するので、
#  接続する線分の数が１である交点が２つ存在しなければならない

# 条件に適合する一筆書きでは、線分の数は(交点の数-1)の19本になる
# すなわち、直線で結ばれない線分は(交点の数-19)の12本になる

p 2**31
=begin
(0..30).to_a.combination(19).to_a.each do |lines|
	pattern = "0" * 31
	lines.each do |i|
		pattern[i] = "1"
	end
#	p pattern
end
exit
=end
count = 0
(520000000...2**31).each do |i|
	if i % 10000000 == 0
		p i 
	end
	ng = false
	end_point_num = 0
	# ２進数の文字列に変換して、線分のパターンにする
	lines = ("0" * 30 + i.to_s(2))[-31, 31]
	next if lines.count("1") != 19
#	p lines
	points = []
#	lines = "0101111110000111110000111111010"
	(0...4).each do |y|
		(0...5).each do |x|
			if y == 0 # 上なし
				point = "0"
			else
				point = lines[x + y * 9 - 5]
			end

			if x == 0 # 左なし
				point << "0"
			else
				point << lines[x + y * 9 - 1]
			end

			if y == 3 # 下なし
				point << "0"
			else
				point << lines[x + y * 9 + 4]
			end

			if x == 4 # 右なし
				point << "0"
			else
				point << lines[x + y * 9]
			end

#			p point
			if point.count("1") == 1
				end_point_num += 1
				if end_point_num > 2
					ng = true
					break
				end
			elsif point.count("1") != 2
				ng = true
				break
			end
			points << point
		end
		break if ng == true
	end
	next if ng == true
	# p points
	if end_point_num == 2
	
		print " "
		(0...lines.length).each do |j|
			print "#{lines[j]} "
			if j % 9 == 3
				print "\n" 
			elsif j % 9 == 8
				print "\n "
			end
		end
		print "\n"

=begin
		num = 0
		(0...4).each do |y|
			num += points[0 + y * 5][3].to_i
		end
		next if num == 0	
		num = 0
		(0...4).each do |y|
			num += points[1 + y * 5][3].to_i
		end
		next if num == 0	
		num = 0
		(0...4).each do |y|
			num += points[2 + y * 5][3].to_i
		end
		next if num == 0	
		num = 0
		(0...4).each do |y|
			num += points[3 + y * 5][3].to_i
		end
		next if num == 0	

		num = 0
		(0...5).each do |x|
			num += points[x + 0 * 5][2].to_i
		end
		next if num == 0	
		num = 0
		(0...5).each do |x|
			num += points[x + 1 * 5][2].to_i
		end
		next if num == 0	
		num = 0
		(0...5).each do |x|
			num += points[x + 2 * 5][2].to_i
		end
		next if num == 0	
		num = 0
		(0...5).each do |x|
			num += points[x + 3 * 5][2].to_i
		end
		next if num == 0	
		num = 0
		(0...5).each do |x|
			num += points[x + 4 * 5][2].to_i
		end
		next if num == 0	
=end
		count += 1
		print "個数：#{count}\n"
	end
end

=begin
(0..30).to_a.combination(19).to_a.each do |lines|
	pattern = "1" * 31
	lines.each do |i|
		pattern[i] = "0"
	end
#	p pattern
end
=end

=begin
# 条件に合うパターンの数
num = 0
# 1×1のセルが無いパターンの数
num_no_1x1 = 0
# 縦と横の隣り合う点を直線で結ぶパターンは2**31通りあり、それぞれについて処理を行う
(0...2**31).each do |i|
	# ２進数の文字列に変換して、線分のパターンにする
	lines = ("0" * 30 + i.to_s(2))[-31, 31]
	# 条件に適合する一筆書きは、線分は11本になる
	next if lines.count("1") != 11
	# 交点のパターンpoints
	points = []
	# 交点のパターンpointsを線分のパターンlinesから作成する
	(0...4).each do |y|
		(0...5).each do |x|
			point = [lines[x + y * 7],     # 上
				 lines[x + y * 7 + 4],      # 右
				 lines[x + y * 7 + 7], # 下
				 lines[x + y * 7 + 3]] # 左
			next if point.flatten.delete("1") == 2
		end
	end
end

# 条件に合うパターンの数を表示
print "結合で作成できるパターン数＝#{num}通り、1×1のセルが無いパターン数＝#{num_no_1x1}通り\n\n"

=end

# 処理終了時刻
t1 = Time.now
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"

exit


cell = [1, 1, 1, 1, 1, 1,
		1, 0, 0, 0, 0, 1,
		1, 0, 0, 0, 0, 1,
		1, 0, 0, 0, 0, 1,
		1, 0, 0, 0, 0, 1,
		1, 1, 1, 1, 1, 1]
		
cell_12 = [1, 1, 0, 0, 0, 0]

cell_21 = [1, 0, 0, 0, 0, 0,
		   1, 0, 0, 0, 0, 0]

cell_13 = [1, 1, 1, 0, 0, 0]

cell_31 = [1, 0, 0, 0, 0, 0,
		   1, 0, 0, 0, 0, 0,
		   1, 0, 0, 0, 0, 0]

cell_14 = [1, 1, 1, 1, 0, 0]

cell_41 = [1, 0, 0, 0, 0, 0,
		   1, 0, 0, 0, 0, 0,
		   1, 0, 0, 0, 0, 0,
		   1, 0, 0, 0, 0, 0]

cell_22 = [1, 1, 0, 0, 0, 0,
		   1, 1, 0, 0, 0, 0]

cell_23 = [1, 1, 1, 0, 0, 0,
		   1, 1, 1, 0, 0, 0]

cell_32 = [1, 1, 0, 0, 0, 0,
		   1, 1, 0, 0, 0, 0,
		   1, 1, 0, 0, 0, 0]
		   
cell_33 = [1, 1, 1, 0, 0, 0,
		   1, 1, 1, 0, 0, 0,
		   1, 1, 1, 0, 0, 0]
		   
cell_24 = [1, 1, 1, 1, 0, 0,
		   1, 1, 1, 1, 0, 0]


cell_42 = [1, 1, 0, 0, 0, 0,
		   1, 1, 0, 0, 0, 0,
		   1, 1, 0, 0, 0, 0,
		   1, 1, 0, 0, 0, 0]


cell_34 = [1, 1, 1, 1, 0, 0,
		   1, 1, 1, 1, 0, 0,
		   1, 1, 1, 1, 0, 0]

cell_43 = [1, 1, 1, 0, 0, 0,
		   1, 1, 1, 0, 0, 0,
		   1, 1, 1, 0, 0, 0,
		   1, 1, 1, 0, 0, 0]


cell_44 = [1, 1, 1, 1, 0, 0,
		   1, 1, 1, 1, 0, 0,
		   1, 1, 1, 1, 0, 0,
		   1, 1, 1, 1, 0, 0]


cellSet = [cell_12, cell_21,
			cell_13, cell_31,
			cell_14, cell_41,
			cell_22,
			cell_23, cell_32,
			cell_33,
			cell_24, cell_42,
			cell_34, cell_43,
			cell_44]


		
		
def print_cell(cell)
	(0...cell.length).each do |i|
		if cell[i] == 1
			print "■"
		else
			print "　"
		end	
		print "\n" if i % 6 == 5
	end
end

print_cell(cell)


x, y = 0, 1
			
i = x + 4 * y

cellPatterns = [[1, 1, 1, 1, 1, 1,
				 1, 0, 0, 0, 0, 1,
				 1, 0, 0, 0, 0, 1,
				 1, 0, 0, 0, 0, 1,
				 1, 0, 0, 0, 0, 1,
				 1, 1, 1, 1, 1, 1]]
loop do
	noSpace = true
	cellPatternNext = []
	cellPatterns.each do |cellPattern|
		(0...36).each do |i|
			cellSet.each_with_index do |cellPat, k|
=begin
		cell = [1, 1, 1, 1, 1, 1,
				1, 1, 1, 1, 0, 1,
				1, 1, 1, 0, 1, 1,
				1, 1, 0, 1, 0, 1,
				1, 0, 1, 0, 1, 1,
				1, 1, 1, 1, 1, 1]
=end
	#			p cellPat
				cell = cellPattern.clone
				canPut = true
				cellPat.each_with_index do |elem, j|
					if elem == 1 && cell[i+j] != 0
						canPut = false
						# print "(#{i%6},#{i/6}): do not put\n"
						break
					end
				end	
				if canPut
					noSpace = false
					cellPat.each_with_index do |elem, j|
						cell[i+j] = k+1 if elem == 1 
					end
					# puts "put"
					# print_cell(cellPat)
					# print_cell(cell)
					cellPatternNext << cell
				end
			end
		end
	end
	# 
	if cellPatterns.length == (cellPatterns |= cellPatternNext).length
		print "結合で作成できるパターン数＝#{cellPatterns.length}通り、"
		count = 0
		cellPatterns.each do |cellPattern|
			if cellPattern.include?(0)
				print_cell(cellPattern)
				count += 1
			end	
		end
		print "1×1のセルが無いパターン数＝#{count}通り\n"
		break
	end
	# 
	cellPatterns |= cellPatternNext
	p cellPatterns.length
end



#line = [0, 1].repeated_permutation(24).collect {|a| a.join }.join(" ")
#p line.length
