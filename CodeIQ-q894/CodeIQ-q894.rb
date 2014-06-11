# coding: utf-8 

# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：セルの結合パターン
# https://codeiq.jp/ace/thisweek_masuipeo/q894


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

# セルを形成している線分lineに番号を付ける
#
#      ┌─┬─┬─┬─┐
#      │  ０  １  ２  │
#      ├３┼４┼４┼６┤
#      │  ７  ８  ９  │
#      ├10┼11┼12┼13┤
#      │  14  15  16  │
#      ├17┼18┼19┼20┤
#      │  21  22  23  │
#      └─┴─┴─┴─┘
#　線分がある場合は 1、ない場合は 0の値を取ると定義する
#
#
#　セルの交点pointに番号を付ける
#
#      ┌─┬─┬─┬─┐
#      │  │  │  │  │
#      ├─０─１─２─┤
#      │  │  │  │  │
#      ├─３─４─５─┤
#      │  │  │  │  │
#      ├─６─７─８─┤
#      │  │  │  │  │
#      └─┴─┴─┴─┘
#　セルの交点の番号とその交点に接続する線分の番号を対応付ける
#　　例
#　　　point[0] = [line[0], line[4], line[7], line[3]]

#　NGとなるパターンは、
#　　1.交点に接続する線分が１本しかない場合
#　　2.交点に接続する線分で、90度の位置にある２本の線分がない場合
ng = [
      # 1の場合
      ["1", "0", "0", "0"],
      ["0", "1", "0", "0"],
      ["0", "0", "1", "0"],
      ["0", "0", "0", "1"],
      # 2の場合
      ["0", "0", "1", "1"],
      ["1", "0", "0", "1"],
      ["1", "1", "0", "0"],
      ["0", "1", "1", "0"]]

#
# 1×1のセルがないかどうかを判定する
#   true :ない
#   false:ある
#
def check_cell(lines)
	# 各セルが1×1のセル（線分で囲まれている）かをチェックする
	# (0, 0)
	return false if                                 lines[0].to_i * lines[3].to_i == 1
	# (0, 1)
	return false if                 lines[0].to_i * lines[1].to_i * lines[4].to_i == 1
	# (0, 2)
	return false if                 lines[1].to_i * lines[2].to_i * lines[5].to_i == 1
	# (0, 3)
	return false if                 lines[2].to_i                 * lines[6].to_i == 1

	# (1, 0)
	return false if lines[3].to_i                 * lines[7].to_i * lines[10].to_i == 1
	# (1, 1)
	return false if lines[4].to_i * lines[7].to_i * lines[8].to_i * lines[11].to_i == 1
	# (1, 2)
	return false if lines[5].to_i * lines[8].to_i * lines[9].to_i * lines[12].to_i == 1
	# (1, 3)
	return false if lines[6].to_i * lines[9].to_i                 * lines[13].to_i == 1

	# (2, 0)
	return false if lines[10].to_i                  * lines[14].to_i * lines[17].to_i == 1
	# (2, 1)
	return false if lines[11].to_i * lines[14].to_i * lines[15].to_i * lines[18].to_i == 1
	# (2, 2)
	return false if lines[12].to_i * lines[15].to_i * lines[16].to_i * lines[19].to_i == 1
	# (2, 3)
	return false if lines[13].to_i * lines[16].to_i                  * lines[20].to_i == 1

	# (3, 0)
	return false if lines[17].to_i                  * lines[21].to_i == 1
	# (3, 1)
	return false if lines[18].to_i * lines[21].to_i * lines[22].to_i == 1
	# (3, 2)
	return false if lines[19].to_i * lines[22].to_i * lines[23].to_i == 1
	# (3, 3)
	return false if lines[20].to_i * lines[23].to_i == 1
	
	# 1×1のセル（線分で囲まれているもの）はない
	return true
end


# 条件に合うパターンの数
num = 0
# 1×1のセルが無いパターンの数
num_no_1x1 = 0
# セルのパターンは2**24通りあり、それぞれについて処理を行う
(0...2**24).each do |i|
	# ２進数の文字列に変換する
	# セルのパターンを線分のパターンlinesに変換する
	lines = ("0" * 23 + i.to_s(2))[-24, 24]
	# 交点のパターンpoints
	points = []
	# NGかどうかのフラグの初期化
	is_ng = false
	# 交点のパターンpointsを線分のパターンlinesから作成する
	(0...3).each do |y|
		(0...3).each do |x|
			point = [lines[x + y * 7],     # 上
				 lines[x + y * 7 + 4], # 右
				 lines[x + y * 7 + 7], # 下
				 lines[x + y * 7 + 3]] # 左
			# すべてのNGのパターンについて処理を行う
			ng.each do |ng_pattern|
				# 交点にNGのパターンが含まれている場合
				if point === ng_pattern
					is_ng = true
					break
				end
			end
			# 交点にNGのパターンが含まれている場合（多重ループを抜けるため）
			break if is_ng == true
		end
		# 交点にNGのパターンが含まれている場合（多重ループを抜けるため）
		break if is_ng == true
	end
	# NGでなかった場合はカウントアップ
	if is_ng == false
		num += 1 
		# 1×1のセルが無い場合はカウントアップ
		num_no_1x1 += 1 if check_cell(lines)
	end
end

# 条件に合うパターンの数を表示
print "結合で作成できるパターン数＝#{num}通り、1×1のセルが無いパターン数＝#{num_no_1x1}通り\n\n"


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
