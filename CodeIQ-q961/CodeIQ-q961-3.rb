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
#n = 7777777
p n

require 'prime'

# 素数の列にはウシが置ける
# 約数の配置パターンの論理和


num = 0
(2...n).each do |i|
#	arr = (1..i).to_a
	arr = []
	#print "#{i} -> "
	#num = 0
	count = 0
	i.prime_division.each do |set|
		2.step(i,set[0]) do |j|
#			arr.delete(j)
			if arr[j] != 1
				arr[j] = 1
				count += 1
			end
		end
#		p arr
	end
	#p arr.length
	num += i - count
#	print "i = #{i}\n"
end

#p 7777777.prime_division


num *= 2
num += 3
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
