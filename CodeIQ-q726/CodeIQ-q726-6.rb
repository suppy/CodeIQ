# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：「0」と「7」の回文数
# https://codeiq.jp/ace/thisweek_masuipeo/q726


# nが回文数になっているかを調べる
# 返り値
#  true ：回文数である
#  false：回文数ではない
def is_palindrome(n)
# p n
	return false if n == 0
	return n.to_s == n.to_s.reverse
end


# 回答の回文数となったかける数を格納する配列
# answer[n] は、nの正の倍数の中で、回文数となる最小の数
answer = [] # 要素が 0の場合は、解なし。nilの場合は、解が見つかっていない
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
	if num.to_s.include?("0") and is_palindrome(num) # 0の文字を含んでいる回文数の場合
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
	next if i == 13
	if answer[i] == 0
		# print "n = #{i} のとき　存在しません\n"
	elsif
		print "n = #{i} のとき　#{i} * #{answer[i]} = #{i * answer[i]}\n"
	end
end
