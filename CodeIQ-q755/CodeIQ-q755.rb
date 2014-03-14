# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：7セグメントコードの反転
# https://codeiq.jp/ace/thisweek_masuipeo/q755

# ７セグメントデータ
# n → ABCDEFG
# 0 → 1111110
# 1 → 0110000
# 2 → 1101101
# 3 → 1111001
# 4 → 0110011
# 5 → 1011011
# 6 → 1011111
# 7 → 1110000
# 8 → 1111111
# 9 → 1111011

$segment = [ "1111110",
			"0110000",
			"1101101",
			"1111001",
			"0110011",
			"1011011",
			"1011111",
			"1110000",
			"1111111",
			"1111011",
			]

# ハミング距離を求める
def hamming_dis(s1, s2)
	count = 0
	(0...s1.length).each do |i|
		count += 1 if s1[i] != s2[i]
	end
	return count
end

# すべての数同士のハミング距離を表示する
def print_hamming_dis
	(0..9).each do |i|
		(0..9).each do |j|
			print "ハミング距離：#{i},#{j} -> #{hamming_dis($segment[i], $segment[j])}\n"
		end
	end
end

# 数字同士のハミング距離のマトリクスを作成する
# hamming_matrix[i * 10 + j]: iと jのハミング距離
hamming_matrix = []
(0..9).each do |i|
	(0..9).each do |j|
		hamming_matrix[i * 10 + j] = hamming_dis($segment[i], $segment[j])
	end
end

switch_num_min = 100
series = []
# すべての並び順のハミング距離の和を求めて、その最小値を得る
(0..9).each do |i|
	(0..9).each do |j|
		next if j == i
		(0..9).each do |k|
			next if k == i or k == j 
			(0..9).each do |l|
				next if l == i or l == j or l == k
				(0..9).each do |m|
					next if m == i or m == j or m == k or m == l
					(0..9).each do |n|
						next if n == i or n == j or n == k or n == l or n == m
						(0..9).each do |o|
							next if o == i or o == j or o == k or o == l or o == m or o == n
							(0..9).each do |p|
								next if p == i or p == j or p == k or p == l or p == m or p == n or p == o
								(0..9).each do |q|
									next if q == i or q == j or q == k or q == l or q == m or q == n or q == o or  q == p
									(0..9).each do |r|
										next if r == i or r == j or r == k or r == l or r == m or r == n or r == o or r == p or r == q
										switch_num = hamming_matrix[i * 10 + j] +
													 hamming_matrix[j * 10 + k] +
													 hamming_matrix[k * 10 + l] +
													 hamming_matrix[l * 10 + m] +
													 hamming_matrix[m * 10 + n] +
													 hamming_matrix[n * 10 + o] +
													 hamming_matrix[o * 10 + p] +
													 hamming_matrix[p * 10 + q] +
													 hamming_matrix[q * 10 + r]
										if switch_num < switch_num_min # 最少切替回数の場合
											switch_num_min = switch_num # 最少切替回数の更新
											series = [] # 表示順をクリア
											series << [i, j, k, l, m, n, o, p, q, r] # 表示順を格納
										elsif switch_num == switch_num_min # 最少切替回数の場合（同じ値）
											series << [i, j, k, l, m, n, o, p, q, r] # 表示順を格納
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
end
print "最少切替回数:#{switch_num_min}\n"
print "表示順\n"
series.each do |s|
#	print "#{s}\n"
	s.each do |num|
		print "#{num} -> "
	end
	print "\n"
end
