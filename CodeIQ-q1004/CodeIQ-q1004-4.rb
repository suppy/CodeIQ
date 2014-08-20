# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：迷路で待ち合わせ？
# https://codeiq.jp/ace/thisweek_masuipeo/q1004


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"


@n = 5

# すべての迷路のパターンを生成する
# 一次元配列で表す
# 0:通路
# 1:壁
# ただし、A地点とB地点は除く
maze_pattern_all = [0, 1].repeated_permutation(@n*@n-2).to_a

#
# 迷路のパターンの周囲に壁を設定する関数
#　移動の処理を簡単にするため（番兵）
#
def set_maze(maze_pattern)
	# 周囲に壁を設定した迷路を格納する配列
	maze = []
	# 上端の壁
	(1..@n+2).each do |i|
		maze << 1
	end
	maze << 1 # A地点の左の壁
	maze << 0 # A地点
	(0...@n*@n-2).each do |i|
		if i % @n == @n - 1
			maze << 1 # 右端の壁
			maze << 1 # 左端の壁
		end
		maze << maze_pattern[i] # 迷路のパターンを設定

	end
	maze << 0 # B地点
	maze << 1 # B地点の右の壁
	# 下端の壁
	(1..@n+2).each do |i|
		maze << 1
	end
	return maze
end


# 方向ベクトル
# 右手法になるように、反時計周りの順番にする
# [下、右、上、左]
@dir_arr = [[0, 1], [1, 0], [0, -1], [-1, 0]] 

#
# 移動先の位置と移動方向を返す関数
#
def next_pos(maze, x, y, dir)
	# 進行方向の、右、上、左、下の順で、通路を探す
	# 通路が見つかれば、移動先の位置 x_next, y_nextと移動方向 dir_nextを返す
	(0...@dir_arr.length).each do |i|
		# 移動方向と移動先を設定
		dir_next = (dir - 1 + i) % @dir_arr.length
		x_next = x + @dir_arr[dir_next][0]
		y_next = y + @dir_arr[dir_next][1]
		# 移動先が通路のとき
		if maze[x_next + (@n + 2) * y_next] == 0 
			return x_next, y_next, dir_next
		end
	end
end


# p maze_pattern_all.length # 8388608
count = 0
maze_pattern_all.each do |maze_pattern|

	# A地点が壁に囲まれているとき
	next if maze_pattern[0] == 1 &&  maze_pattern[@n - 1] == 1
	# B地点が壁に囲まれているとき
	next if maze_pattern[-@n] == 1 && maze_pattern[-1] == 1 

	# 迷路のパターンの周囲に壁を設定する（番兵）
	maze = set_maze(maze_pattern)

	# 初期位置、移動方向の設定
	a_x, a_y = 1, 1 # A地点
	a_dir = 0 # 下方向
	b_x, b_y = @n, @n # B地点
	b_dir = 2 # 上方向

	# これまでに通過した、位置と移動方向の組をキーとするハッシュ
	a_h = {}
	b_h = {}

	loop do

		# 位置と移動方向の組をハッシュのキーにして、値を1に設定
		a_h[[a_x, a_y, a_dir]] = 1
		b_h[[b_x, b_y, b_dir]] = 1
		
		# 移動
		a_x, a_y, a_dir = next_pos(maze, a_x, a_y, a_dir)
		b_x, b_y, b_dir = next_pos(maze, b_x, b_y, b_dir)

		# これまでに通過した、位置と移動方向の組のときは
		# A地点からB地点に行く通路がない
		break if a_h[[a_x, a_y, a_dir]] == 1
		break if b_h[[b_x, b_y, b_dir]] == 1
		
		# A地点→B地点に到着
		break if a_x == @n && a_y == @n 
		# B地点→A地点に到着
		break if b_x ==  1 && b_y ==  1 

		# 出会った！
		if a_x == b_x && a_y == b_y 
			count += 1
			break
		end
	end
end
p count

=begin
print "(#{x}, #{y}) #{dir}\n"
x, y, dir = next_pos(set_maze(maze), x, y, dir)
print "(#{x}, #{y}) #{dir}\n"
x, y, dir = next_pos(set_maze(maze), x, y, dir)
print "(#{x}, #{y}) #{dir}\n"
x, y, dir = next_pos(set_maze(maze), x, y, dir)
print "(#{x}, #{y}) #{dir}\n"
x, y, dir = next_pos(set_maze(maze), x, y, dir)
print "(#{x}, #{y}) #{dir}\n"
x, y, dir = next_pos(set_maze(maze), x, y, dir)
print "(#{x}, #{y}) #{dir}\n"
x, y, dir = next_pos(set_maze(maze), x, y, dir)
print "(#{x}, #{y}) #{dir}\n"
x, y, dir = next_pos(set_maze(maze), x, y, dir)
print "(#{x}, #{y}) #{dir}\n"
x, y, dir = next_pos(set_maze(maze), x, y, dir)
print "(#{x}, #{y}) #{dir}\n"
x, y, dir = next_pos(set_maze(maze), x, y, dir)
print "(#{x}, #{y}) #{dir}\n"
x, y, dir = next_pos(set_maze(maze), x, y, dir)
print "(#{x}, #{y}) #{dir}\n"
x, y, dir = next_pos(set_maze(maze), x, y, dir)
print "(#{x}, #{y}) #{dir}\n"
x, y, dir = next_pos(set_maze(maze), x, y, dir)
print "(#{x}, #{y}) #{dir}\n"
x, y, dir = next_pos(set_maze(maze), x, y, dir)
print "(#{x}, #{y}) #{dir}\n"
x, y, dir = next_pos(set_maze(maze), x, y, dir)
print "(#{x}, #{y}) #{dir}\n"
x, y, dir = next_pos(set_maze(maze), x, y, dir)
print "(#{x}, #{y}) #{dir}\n"
x, y, dir = next_pos(set_maze(maze), x, y, dir)
print "(#{x}, #{y}) #{dir}\n"
x, y, dir = next_pos(set_maze(maze), x, y, dir)
print "(#{x}, #{y}) #{dir}\n"
x, y, dir = next_pos(set_maze(maze), x, y, dir)
print "(#{x}, #{y}) #{dir}\n"
x, y, dir = next_pos(set_maze(maze), x, y, dir)
print "(#{x}, #{y}) #{dir}\n"
x, y, dir = next_pos(set_maze(maze), x, y, dir)
print "(#{x}, #{y}) #{dir}\n"
x, y, dir = next_pos(set_maze(maze), x, y, dir)
print "(#{x}, #{y}) #{dir}\n"
x, y, dir = next_pos(set_maze(maze), x, y, dir)
print "(#{x}, #{y}) #{dir}\n"
x, y, dir = next_pos(set_maze(maze), x, y, dir)
print "(#{x}, #{y}) #{dir}\n"
x, y, dir = next_pos(set_maze(maze), x, y, dir)
print "(#{x}, #{y}) #{dir}\n"
x, y, dir = next_pos(set_maze(maze), x, y, dir)
print "(#{x}, #{y}) #{dir}\n"
=end

# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
