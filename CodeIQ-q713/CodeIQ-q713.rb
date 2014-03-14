# コード銀行：階段ピョンピョン１２３！

# 階段を上がるパターンを文字列で表す
# (1)3段を一歩で上がる　→　"3"
# (2)2段、1段と、二歩で上がる　→　"21"
# (3)1段、2段と、二歩で上がる　→　"12"
# (4)1段、1段、1段と、三歩で上がる　→　"111"

# i段の階段の上がり方のパターンを返す関数
#  n:求める階段の段数
#  i:i段目
#  pattern1:i-1段のときのパターン
#  pattern2:i-2段のときのパターン
#  pattern3:i-3段のときのパターン
def make_pattern_i(n, i, pattern1, pattern2, pattern3)

	pattern = [] # i段の上がり方のパターンを格納する配列

	# i-1段のときのパターンの片側に "1" を加えたものを i段のときのパターンに追加する
	pattern1.each do |item|
		pattern << item + "1"
		pattern << "1" + item
	end
	
	# i-2段のときのパターンの片側に "2" を加えたものを i段のときのパターンに追加する
	pattern2.each do |item|
		pattern << item + "2"
		pattern << "2" + item
	end
	
	# i-3段のときのパターンの片側に "3" を加えたものを i段のときのパターンに追加する
	pattern3.each do |item|
		pattern << item + "3"
		pattern << "3" + item
	end

	pattern.uniq! # パターンの重複を除く
	
	# この時点で、配列 pattern には i段のときのすべてのパターンが格納されている

	print "n = " + n.to_s + " "
	print "i = " + i.to_s + " "
	print "num = " + pattern.size.to_s + "\n"

	if n == i # 求める階段の段数になったとき
		return pattern # パターンを返す
	end


	# i段のときのパターン pattern を元に、i+1段の階段の上がり方のパターンを求める
	#  i段のときのパターン:  pattern
	#  i-1段のときのパターン:pattern1
	#  i-2段のときのパターン:pattern2
	make_pattern_i(n, i + 1, pattern, pattern1, pattern2)
	
end

# n段の階段の上がり方のパターンを返す関数
def make_pattern(n)

	pattern1 = ["2", "11"]              # 階段が 2段のときのパターン
	pattern2 = ["1"]                    # 階段が 1段のときのパターン
	pattern3 = [""]                     # 階段が 0段のときのパターン

	# 3段未満が指定された場合
	if n == 2
		return pattern1
	elsif n == 1
		return pattern2
	elsif n < 1
		return pattern3
	end
	
	# n段の階段の上がり方のパターン
	return make_pattern_i(n, 3, pattern1, pattern2, pattern3)
end

# p make_pattern(3).size # => 4
# p make_pattern(4).size # => 7
# p make_pattern(5).size # => 13
# p make_pattern(6).size # => 24
# p make_pattern(7).size # => 44
# p make_pattern(8).size # => 81
p make_pattern(30).size # => 53798080
