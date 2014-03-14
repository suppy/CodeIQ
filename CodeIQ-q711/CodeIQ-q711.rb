# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：運命の出会いは何通り？
# https://codeiq.jp/ace/thisweek_masuipeo/q711

SIZE = 6


def F(m,n)
	if m == 0 or n == 0
		return 1
	end
	return F(m, n - 1) + F(m - 1, n)
end

p F(6, 6) * F(6, 6)
# exit

$count = 0
$total_count = 0

def move(mx, my, wx, wy, meet, n, path)
# print ("(#{mx},#{my})(#{wx},#{wy})\n")
	if mx == SIZE and my == SIZE and wx == 0 and wy == 0
#		return meet
# exit
=begin
print meet
print ":"
path.each do |direction|
	print direction + " "
end
print "\n"
=end
		if meet == 3
			$count += 1
#			p "meet!"
		end	
#		print "\n"
		$total_count += 1
	else
		if mx == wx and my == wy
			meet = 3
		elsif mx == wx
			meet |= 1
		elsif my == wy
			meet |= 2
		end

		path1 = path.clone
		if mx < SIZE and wx > 0
#			print "#{n}:→←\n"
			path1 << "→←"
			move(mx + 1, my, wx - 1, wy, meet, n + 1, path1)
		end
		path1 = path.clone
		if my < SIZE and wx > 0
#			print "#{n}:↓←\n"
			path1 << "↓←"
			move(mx, my + 1, wx - 1, wy, meet, n + 1, path1)
		end
		path1 = path.clone
		if my < SIZE and wy > 0
#			print "#{n}:↓↑\n"
			path1 << "↓↑"
			move(mx, my + 1, wx, wy - 1, meet, n + 1, path1)
		end
		path1 = path.clone
		if mx < SIZE and wy > 0
#			print "#{n}:→↑\n"
			path1 << "→↑"
			move(mx + 1, my, wx, wy - 1, meet, n + 1, path1)
		end
	end
# p "exit_move"
end

path = []
move(0, 0, SIZE, SIZE, 0, 1, path)
p $count
p $total_count
# p $count / $total_count

