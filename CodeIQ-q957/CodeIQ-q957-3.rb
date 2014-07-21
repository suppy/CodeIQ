# @Nabetani  鍋谷 武典さんからのアルゴリズムの問題
# 長くなるように、増え続けるように
# https://codeiq.jp/ace/nabetani_takenori/q957

# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"


# data.txtの内容を読み込んで、配列dataに格納する
data = []
File.open("data.txt") do |f|
	while line = f.gets
		no, n, num = line.split(' ') # データ番号, 入力データ, 出力の期待値
#		print "#{no},#{n},#{num}\n"
		data << [no, n, num]
	end
end
#p data.length

#n = "1"
#n = "1234"
#n = "23342020662"
#n = "23342121662"
#n = "100000000000000000000123456789123456789123456789"
#n = "16949848928757660134205746936438965754667779234288272066193900384816749587196430651049827210153585851475205217412607555474367483"
#n = "80010007000000006540065085900000008104004206001040081030501002109805001806080002304500020002064100903011000100090007009704954053"
#p n


#
# 値がどんどん増えていく数列 (狭義単調増加列)を作る再帰関数
# これまでに作った数列の次の項を、残っている数字の文字列から作成する
#  series:これまでに作った数列
#  n_str :残っている数字の文字列
#
def make_series(series, n_str)
	#p "call make_series" 
	#p series
	#p n_str
	
	# 残りの文字列長が０の場合は数列が完成した場合
	if n_str.length == 0
		# 要素数の最大値を更新
		@max_num = [series.length, @max_num].max
		#print "max #{@max_num}\n"
		#p series
		return
	end

=begin 
	if series.length == 0
		series_1 = [n_str[0, 1].to_i]
		n_str_1 = n_str[1..-1]
		make_series(series_1, n_str_1)
		return
	end
=end
	# 文字列の最初が"0"の場合	
	while n_str[0] == "0"
		# 数列の最後の項に、文字列の先頭の文字"0"を追加する
		series[-1] = (series[-1].to_s + n_str[0]).to_i
		# 先頭の文字を除いた文字列にする
		n_str = n_str[1..-1]
	end
	
	# 数列の最後の項
	n = series[-1]
	# 数列の最後の項の桁数
	k = series[-1].to_s.length
	# 桁数が残りの文字数より小さい間、処理を行う
	while k <= n_str.length
		# 文字列から桁数分だけの文字を取り出して、数値に変換する
		n_1 = n_str[0, k].to_i
		#p n_str
		#print "n:#{n} n_1:#{n_1}\n"
		# 値がどんどん増えていく数列になる場合
		if n < n_1
			# 数列に、値を追加
			series_1 = series.clone
			series_1 << n_1
			# 追加した値の文字列を除いたものを新しい文字列にする
			n_str_1 = n_str[k..-1]
			# 再帰関数を呼ぶ
			make_series(series_1, n_str_1)
		end
		# 桁数をインクリメント
		k += 1
	end
end

# すべてのデータについて処理を行う
data.each do |data_arr|
	# 入力データを文字列に設定
	n_str = data_arr[1]
#	n_str = "149247630076000000"
	#n_str_len = n_str.length
	# 数列を初期化
	series = []
	# 要素数の最大値を初期化
	@max_num = 1
	# 数列の初項の文字列長が１～文字列長の半分の値の場合について処理を行う
	(1..n_str.length/2+1).each do |i|
		# 第２項が"0"で始まる場合
		next if n_str[i] == "0"
		# 数列の初項を設定
		series = [n_str[0, i].to_i]
		# 初項の数字を除いた文字列を設定
		n_str_1 = n_str[i..-1]
		# 値がどんどん増えていく数列 (狭義単調増加列)を作る再帰関数を呼ぶ
		make_series(series, n_str_1)
	end
	# 出力の期待値と要素数の最大値が異なる場合はデータ番号を表示する
	if data_arr[2].to_i != @max_num
		print "#{data_arr[0]},"
	end
#	print "#{data_arr[0]} #{data_arr[2]}:#{@max_num}\n"
end


# 処理終了時刻
t1 = Time.now
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"

exit

#sep_num = 24

max_num = 0
#p (0...n.length-1).to_a.combination(sep_num).to_a.length
#exit

series = []
i = 0
while i < n.length
	j = 1
	while n[i + j] == "0"
		j += 1
	end
	series << n[i, j]
	i += j 	
end
p series

exit


def make_series(series, n_str)
	if n_str == ""
		return true
	end
	if n_str[0] = "0"
		return false
	end
	k = series[-1].to_s.legth
	if k > n_str.length
		return false
	end
	while k < n_str.length
		if series[-1] < n_str[0, k].to_i
			series << n_str[0, k].to_i
			n_str = n_str[k..-1]
			if !make_series(series.clone, n_str.clone)
				n_str = series.pop.to_s + n_str
				k += 1
			end
		else
			k += 1
		end
	end
	p series
end


series = [2]
n = n[1..-1]
p n
make_series(series, n)

exit
exit


(1..n.length/2).each do |i|
	series = [n[0, i].to_i]
	p series
	n_next = n[i..-1]
	p n_next
	j = i
	while j > n.length
		k = series[-1].to_s.length
		p k
		if series[-1] < n_next[0, k].to_i
			series << n_next[0, k].to_i
			p series
		else
			k += 1
		end		
	end

end


def make_series(series, n_str)
	p series
	p n_str
	if n_str[0] == "0"
		return -1
	end
	k = series[-1].to_s.length
	if k > n_str.length
		return -1
	end
	while k <= n_str.length do
		if series[-1] < n_str[0, k].to_i
			series << n_str[0, k].to_i
			n_str = n_str[k..-1]
			if n_str.length < k
				return -1
			end
			if make_series(series.clone, n_str.clone) == -1
				n_str = series.pop.to_s + n_str
				p n_str
				k += 1
			end
		else
			k += 1
		end
	end
end


series = [2]
n = n[1..-1]
p n
make_series(series, n)

exit

(1..n.length/2).each do |j|
	series = [n[0, j].to_i]
	i = j
	k = 1
	while i + k <= n.length do
		if series[-1] < n[i, k].to_i && n[i+k] != "0"
			series << n[i, k].to_i
			i += k
		else
			k += 1
		end
	end
	p series
end
exit


(0...n.length-1).to_a.combination(sep_num).each do |pattern|
#	p pattern
	series_str = ""
	(0...n.length-1).each do |i|
		series_str += n[i]
		if pattern.include?(i)
			series_str += "|"
		end
	end
	series_str += n[-1]
	#p series_str
	series = series_str.split('|')
	#p series
	is_asc = true
	(series.length-1).downto(0).each do |i|
		if series[i+1][0] == "0"
			is_asc = false
			break
		end
		if series[i].to_i >= series[i+1].to_i
			is_asc = false
			break
		end		
	end
	if is_asc
		max_num = [max_num, series.length].max
		p series
	end

end
p max_num
