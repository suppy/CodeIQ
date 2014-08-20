# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：反転で作る互い違い
# https://codeiq.jp/ace/thisweek_masuipeo/q1016


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

# n = 3
n = 8

# "0" : 白いカード
# "1" : 黒いカード
# カードの並びの初期値
ring_init = "0" * n + "1" * n

# カードの並び方の集合
ring_set = [ring_init]
count = 1
loop do
	ring_set_next = ring_set.clone
	# カードの並び方のそれぞれについて、処理を行う
	ring_set.each do |ring|
		# カードを入れ替える位置のそれぞれについて、処理を行う
		(0...2 * n).each do |i|
			ring_next = ring.clone
			# 連続する 3枚のカードを異なる色に入れ替える
			3.times do |j|
				if ring[(i + j) % (2 * n)] == "0"
					ring_next[(i + j) % (2 * n)] = "1"
				else
					ring_next[(i + j) % (2 * n)] = "0"
				end
			end
			
			# 奇数番目の数字と偶数番目の数字を取り出す
			ring_odd = ""
			ring_even = ""
			(0...2 * n).each do |j|
				if j % 2 == 1
					ring_odd += ring_next[j]
				else
					ring_even += ring_next[j]
				end
			end
			# 白と黒が交互に並んでいるかを判定する
			if ring_odd == "0" * n and ring_even == "1" * n or
				ring_odd == "1" * n and ring_even == "0" * n
				# 交換回数を表示
				p count
				exit
			end
			ring_set_next << ring_next
		end
	end
	ring_set = ring_set_next.uniq
	count +=1
end


# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
