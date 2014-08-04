# Short Coder @ozy4dm  Ozy@彦星さんからのアルゴリズムの問題
# 七夕問題☆牽牛 彦星 牛をもっと飼う
# https://codeiq.jp/ace/ozy_hikoboshi/q961

# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"


# 牛舎のサイズ
n = 7 # 25
n = 77 # 3545
n = 777 # 366641
n = 7777 # 36761793
n = 77777 # 3677453621
n = 777777 # 367757228689
n = 7777777 # 36775823261333
p n

require 'prime'

# 牛舎を、彦星がいる位置を原点とするXY座標で表すとする

# 座標(x, y)の場所にウシが置けるのは、
# 分数 y / x が既約分数になっている場合である
# 既約分数になるのは、分子が、分母の約数の倍数になっていないときである

# ウシの配置は、直線y=xで対称となる
# 1<y<xの範囲のウシの配置を求めたものを2倍し、　　(1)
# 彦星に隣接した位置にいるウシの数である3を加算したものが、求める答えとなる　　(2)

# また、x>=3でのウシの配置は、直線y=x/2で対称となっている（証明はわかりません）
# 0<y<x/2の範囲でウシの配置を求めたものを2倍し、
# 座標(2, 1)のウシ1を加算し、
# 2倍し、　※上記の(1)
# 3を加算したものが、求める答えとなる　　※上記の(2)

# ウシの数
num = 0
# x>=3, 0<y<x/2の範囲でウシの配置を求める
# 言い換えると、座標(x,y)のうち、分数y/xが既約分数になる個数を数える
(3...n).each do |i|
	# 既約分数かどうかを表す配列
	# arr[j] = 1 # j/iは既約分数ではない
	arr = []
	# 既約分数になっていない個数を数える
	# 言い換えると、分子が、分母の約数の倍数になっている個数を数える
	count = 0
	i.prime_division.each do |divisor|
		divisor[0].step(i/2,divisor[0]) do |j|
			# 個々の約数で重複して数えることがないようにする
			if arr[j] != 1
				arr[j] = 1
				count += 1
			end
		end
	end

	# 既約分数になっている個数を求め、
	# ウシの数に加算する	
	num += i/2 - count
end


num *= 2 # 直線y=x/2で対称なので、2倍
num += 1 # 座標(2, 1)に配置したウシを加算
num *= 2 # 直線y=xで対称なので、2倍
num += 3 # 彦星に隣接するウシの数3を加算
p num


# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"

exit

i = 1
loop do
	(i..n).each do |x|
		(x..n).each do |y|
		
		end
	end
	i += 1
	break if i > n
end

exit

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

# ウシをカウント
p gyusha.count(2)

(1..n).each do |y|
	(1..n).each do |x|
		print gyusha[x + y * n]
	end
	print "\n"
end


# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
