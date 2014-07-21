# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：素数のマトリックス
# https://codeiq.jp/ace/thisweek_masuipeo/q958

# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"


# 3桁の素数をすべて求め、配列 prime に格納
prime = []
(100..999).each do |i|
	is_prime = true
	(2..(i-1)).each do |j|
		if i % j == 0
			is_prime = false
			break
		end
	end
	if is_prime
		prime << i
	end
end
# p prime

# 求めるパターン数
count = 0

# 3桁の素数から長さ ３ の順列を作成し、処理を行う
prime.permutation(3).each do |prime_set|
	# prime_set[0]:素数のマトリックスの１行目
	# prime_set[1]:素数のマトリックスの２行目
	# prime_set[2]:素数のマトリックスの３行目

	# 素数のマトリックスに含まれる素数を prime_matrix に格納する
	prime_matrix = prime_set.clone
	
	# 素数のマトリックスの１列目の数字
	num = prime_set[0] / 100 * 100 + prime_set[1] / 100 * 10 + prime_set[2] / 100
	# 素数ではない、素数のマトリックスに使われている
	if !prime.include?(num) || prime_matrix.include?(num)
		next
	end
	# 素数のマトリックスに追加
	prime_matrix << num
	
	# 素数のマトリックスの２列目の数字
	num = prime_set[0] / 10 % 10 * 100 + prime_set[1] / 10 % 10 * 10 + prime_set[2] / 10 % 10
	# 素数ではない、素数のマトリックスに使われている
	if !prime.include?(num) || prime_matrix.include?(num)
		next
	end
	# 素数のマトリックスに追加
	prime_matrix << num
	
	# 素数のマトリックスの３列目の数字
	num = prime_set[0] % 10 * 100 + prime_set[1] % 10 * 10 + prime_set[2] % 10
	# 素数ではない、素数のマトリックスに使われている
	if !prime.include?(num) || prime_matrix.include?(num)
		next
	end
	# 素数のマトリックスに追加
	prime_matrix << num
	
	count += 1
end
p count


=begin
(100100100..999999999).each do |i|

end
=end
=begin
(0..9).to_a.repeated_permutation(9).each do |pattern|

end
=end



# 処理終了時刻
t1 = Time.now
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
