# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：迷路で待ち合わせ？
# https://codeiq.jp/ace/thisweek_masuipeo/q1004


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

@n = 5

maze_all = [0, 1].repeated_permutation(@n*@n-2).to_a
#p maze

#maze = [1,1,1,1,1,1,1,1,1,1,1,1,1,1]
def disp_maze(maze)
	#n = Math.sqrt(maze.length+2)
	printf "Ａ"
	(0...@n*@n-2).each do |i|
		print "　" if maze[i] == 0
		print "■" if maze[i] == 1
		print "\n" if i % @n == @n-2
	end
	print "Ｂ\n"

end

#p maze[10]
#disp_maze(maze[10])
=begin
maze.each do |m|
	disp_maze(m)
end
=end

def set_maze(maze)
	m = []
	(1..@n+2).each do |i|
		m << 1
	end
	m << 1
	m << 2
	(0...@n*@n-2).each do |i|
		if i % @n == @n - 1
			m << 1
#		elsif i % @n == @n - 4
			m << 1
		else
		end
		m << maze[i]

	end
	m << 3
	m << 1
	(1..@n+2).each do |i|
		m << 1
	end
	return m
end

#maze = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
#p set_maze(maze)
#p set_maze(maze).length


@dir_arr = [[0, 1], [1, 0], [0, -1], [-1, 0]]

def next_pos(maze, x, y, dir)
	find_path = false
	(0...@dir_arr.length).each do |i|
		dir_next = (dir - 1 + i) % @dir_arr.length
		x_next = x + @dir_arr[dir_next][0]
		y_next = y + @dir_arr[dir_next][1]
		if maze[x_next + (@n + 2) * y_next] == 0
			find_path = true
			return x_next, y_next, dir_next
		end
		if maze[x_next + (@n + 2) * y_next] == 2
			find_path = true
			return x_next, y_next, dir_next
		end
		if maze[x_next + (@n + 2) * y_next] == 3
			find_path = true
			return x_next, y_next, dir_next
		end
	end

	return x - dir[0], y - dir[1], (dir + @dir_arr.length) % @dir_arr.length
end
p maze_all.length # 8388608
count = 0
(0...maze_all.length).each do |i|

#maze = maze_all[100000]
maze = maze_all[i]
#p maze
#disp_maze(maze)
next if maze[0] == 1 &&  maze[4] == 1
next if maze[18] == 1 && maze[22] == 1

maze = set_maze(maze)
a_x_start, a_y_start = 1, 1
a_dir = 0
b_x_start, b_y_start = 5, 5
b_dir = 2
a_x, a_y = a_x_start, a_y_start
b_x, b_y = b_x_start, b_y_start
25.times do
#	print "a(#{a_x}, #{a_y}) #{a_dir} "
#	print "b(#{b_x}, #{b_y}) #{b_dir}\n"
	a_x, a_y, a_dir = next_pos(maze, a_x, a_y, a_dir)
	b_x, b_y, b_dir = next_pos(maze, b_x, b_y, b_dir)
	break if b_x ==  1 && b_y ==  1
	break if a_x == @n && a_y == @n
	if a_x == b_x && a_y == b_y
		#print "meet!\n"
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
