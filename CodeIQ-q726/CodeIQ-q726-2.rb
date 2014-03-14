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
p n
	return n.to_s == n.to_s.reverse
end

(27..50).each do |i|
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

	# かける数を増やしていき、解を見つける
	while true
		upper4 = j.to_s[0, 4].to_i
		if  upper4 < 2590 or upper4 > 2881
			j = 2590 * 10 ** (j.to_s.length - 3) + 1
			next
		end
		#print "#{j}\n"
		k = i * j
		# kが「0と7の数字のみ」で構成されており、回文数の場合
		if is_zero_or_seven(k) and is_palindrome(k) 
			print "n = #{i} のとき　#{i} * #{j} = #{k}\n"
			# print "#{k},"
			break
		end
		j += 10 # 一の位は変更しなくてよいので、十の位を増やしていく
	end
end
