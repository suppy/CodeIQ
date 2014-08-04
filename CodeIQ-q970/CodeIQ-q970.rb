# @iskmsy  井関 正也さんからのアルゴリズムの問題
# ゲームに勝つ確率は？
# https://codeiq.jp/ace/iseki_masaya/q970


# 問1（レベル1）
# 3. 0.547

# 問2（レベル2）
# 2. 0.113

# 問3（レベル3）
#


# 指定された範囲の数字
n = 40

# M個の数字を重複なしにランダムに選択
m = 18

# 相手が選んだ数字とK個以上同じだった場合、勝利
k = 8

total = 0
win = 0
# numbers_opponent = (1..n).to_a.combination(m).to_a[0]
numbers_opponent = (1..m).to_a
p numbers_opponent

=begin
# 負ける場合の数
lose = 0
(0...k).each do |i|
	lose += (1..n).to_a.combination(i).to_a.length
end
p lose
exit
=end

#p (1..n).to_a.combination(m).to_a.length
	(1..n).to_a.combination(m).to_a.each do |numbers_mine|
#		print "#{numbers_mine}:#{numbers_opponent}\n"
		if (numbers_mine & numbers_opponent).length >= k
			win += 1
		end
		total += 1
#		p total
	end
p win
p total
p win.to_f / total
