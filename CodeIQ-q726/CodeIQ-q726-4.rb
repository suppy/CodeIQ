# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：「0」と「7」の回文数
# https://codeiq.jp/ace/thisweek_masuipeo/q726


# nに含まれている数字を調べる
# 返り値
#  true ：nに含まれている数字が、0と7のみ
#  false：上記以外
def is_zero_or_seven(n)
	number = ["1", "2", "3", "4", "5", "6", "8", "9"] # 0と7以外を文字列にして配列に格納
	number.each do |c|
		if n.to_s.include?(c) # 0と7以外の文字が含まれている場合は、falseを返す
			return false
		end
	end
	return true # 0と7以外の文字が含まれていないので、trueを返す
end

# nが回文数になっているかを調べる
# 返り値
#  true ：回文数である
#  false：回文数ではない
def is_palindrome(n)
# p n
	return false if n == 0
	return n.to_s == n.to_s.reverse
end

# n桁の「0」と「7」の回文数の最小値と最大値を計算する
#　n = 5 のとき、
#  palindrome['min'] = 70007
#  palindrome['max'] = 77777
def range_palindrome(n)
	if n == 1 # １桁の場合
		return {'min' => 7, 'max' => 7}
	end
	palindrome = Hash::new
	palindrome['min'] = ("7" + "0" * (n - 2) + "7").to_i
	palindrome['max'] = ("7" + "7" * (n - 2) + "7").to_i

	return palindrome
end

=begin
p range_palindrome(1)
palindrome = range_palindrome(3)
p palindrome
min_j = palindrome['min'] / 27
max_j = palindrome['max'] / 27 + 1
p min_j
p max_j
exit
=end

# 回答の回文数を格納する配列
# answer[n] は、nの正の倍数の中で、回文数となる最小の数
answer = [] # 要素が 0の場合は、解なし
answer[0] = 0 # 配列は、(1..50)の範囲のindexを使用するので、answer[0]は、解なしとしておく
(1..50).each do |i|
	if i % 2 == 0 or i % 5 == 0 # 偶数および 5の倍数の場合は、一の位が 7になることはないので、解は存在しない。
		answer[i] = 0
	end
end

i = 1
isFound = false # 1～50までのすべての解が見つかった場合は true
while !isFound # すべての解が見つかるまで繰り返す
	# iを２進数の文字列にし、それを整数型に変換し、7をかける
	# これにより、numは必ず、0と7のみの文字を含む数字となる
	num = i.to_s(2).to_i * 7
	if is_palindrome(num) # 回文数の場合
		(1..50).each do |i| # 1～50までの数で回文数 numが割り切れるものを探す
			if num % i == 0 and answer[i] == nil # 割り切れて、かつ、これまでに解が見つかっていない場合
				answer[i] = num / i # 回文数となったかける数を格納
				# print "n=#{i}のとき #{i} × #{num / i} = #{num}\n"
				# print "nilは残り#{answer.count(nil)}\n"
			end
			if !answer.include?(nil) # nil がなくなれば、1～50までのすべての解が求まっている
				isFound = true # すべての解が見つかった
				break
			end
		end
	end
	i += 1
end

# 結果を表示する
(1..50).each do |i|
	if answer[i] == 0
		print "n = #{i} のとき　存在しません\n"
	elsif
		print "n = #{i} のとき　#{i} * #{answer[i]} = #{i * answer[i]}\n"
	end
end
p answer
exit

(28..50).each do |i|
	# n = 13の場合は、例で求めてあるので、スキップする
#	if i == 13
#		next
#	end
	
	# nの一の位の数字によっては、解が存在しない
	if i % 2 == 0 # 偶数
		print "n = #{i} のとき　存在しません\n"
		next
	end		
	if i % 5 == 0 # 5の倍数
		print "n = #{i} のとき　存在しません\n"
		next
	end		

	# i * j の一の位が7の場合のみ、解の可能性があるので、
	# iの一の位の数字によって、jの一の位の数字が決まる
=begin
	case i % 10
	when 1
		j = 7
	when 3
		j = 9
	when 7
		j = 1
	when 9
		j = 3
	else
		j = 1
	end
=end
	
	# かける数を増やしていき、解を見つける
	isFound = false # 回文数が見つかった場合、true
	digit = 1 # 「0」と「7」の数の桁数
	while !isFound # 回文数が見つかるまで繰り返す
		palindrome = range_palindrome(digit) # 指定した桁数の回文数の最小値と最大値を計算する
		min_j = (palindrome['min'] / i) / 10 * 10 # かける数の最小値。ただし、一の位は切り捨てる
		# i * j の一の位が 7の場合のみ、解の可能性があるので、
		# iの一の位の数字によって、jの一の位の数字が決まる
		min_j += [nil, 7, nil, 9, nil, nil, nil, 1, nil, 3][i % 10] 
		max_j = palindrome['max'] / i + 1 # かける数の最大値
		print "#{digit}桁：（#{min_j}, #{max_j})\n"
		# 指定した桁数の回文数が存在するとすれば、かける数 jは (min_j..max_j)の範囲内になる
		# この範囲で解を探す
		# かける数 jの一の位は決まっているので、10ずつ増やしている
		min_j.step(max_j, 10) do |j|
			#print "#{j}\n"
			k = i * j
			# kが「0と7の数字のみ」で構成されており、回文数の場合
			if is_zero_or_seven(k) and is_palindrome(k) 
				isFound = true # 回文数が見つかった
				print "n = #{i} のとき　#{i} * #{j} = #{k}\n"
				# print "#{k},"
				break
			end
		end
		digit += 1 # 「0」と「7」の数の桁数を増やす
	end
end
