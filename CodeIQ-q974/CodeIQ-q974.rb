# CodeIQコード銀行  コードお預かり窓口さんからのウチに来ない？の問題
# コード銀行：ABC迷路
# https://codeiq.jp/ace/code_teller/q974


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"


@maze = []
@x_max = 0
@y_max = 0
#filename = "sample.in.txt"
#filename = "case1.in.txt"
#filename = "case2.in.txt"
#filename = "case3.in.txt"
#filename = "case4.in.txt"
#filename = "case5.in.txt"
#filename = "case6.in.txt"
filename = "case7.in.txt"
File.open(filename, "r") do |f|
	while line = f.gets
		row = line.chop.split('')
		@x_max = row.length
		@y_max += 1
		@maze << "X"
		@maze << row
		@maze << "X"
	end
end
(@x_max+2).times do
	@maze.unshift "X"
end
(@y_max+2).times do
	@maze << "X"
end
@maze.flatten!
#p @maze
#p @x_max
#p @y_max

def pos(x, y)
	return x + y * (@x_max + 2)
end

def disp(path)
	(@maze.length).times do |i|
		if path.include?(i)
			print "O"
		else
			print " "
		end
		print "\n" if i % (@x_max + 2) == @x_max + 1
	end
	print "\n"
end


@possible = false
x, y = 1, 1
@chr = "ABCA"
def search(x, y, path)
	if x == @x_max && y == @y_max
		@possible = true
		disp(path)
		return
	end
	[[-1, 0], [0, -1], [1, 0], [0, 1]].each do |dir|
		next if @maze[pos(x + dir[0], y + dir[1])] == "X"
		next if path.include?(pos(x + dir[0], y + dir[1]))
		next if @maze[pos(x + dir[0], y + dir[1])] != @chr[@chr.index(@maze[pos(x, y)]) + 1]
		path_added = path.clone
		path_added << pos(x + dir[0], y + dir[1])
		# print "(x, y) = (#{x + dir[0]}, #{y + dir[1]})\n"
		# p path_added
		# disp(path_added)
		search(x + dir[0], y + dir[1], path_added)
		return if @possible
	end
end
path = [pos(x, y)]
search(x, y, path)
p @possible

filename.gsub!("in", "out")
File.open(filename, "w") do |f|
	if @possible
		f.puts "possible"
	else
		f.puts "impossible"
	end
end

# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
