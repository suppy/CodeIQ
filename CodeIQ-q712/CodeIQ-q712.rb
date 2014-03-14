# CodeIQコード銀行  コードお預かり窓口さんからのウチに来ない？の問題
# コード銀行：3年C組の成績表

# 科目数 + 1(合計)
subject_num = 6

# 入力データ
seiseki = []

=begin
seiseki = [ 100, 80, 90, 70, 70, 50, 50, 80, 90, 50 ]
p seiseki
=end

=begin
seiseki << [ "竹内海斗",52,46,36,44,31 ]
seiseki << ["近藤美月",33,37,43,32,25]
seiseki << ["中島優",63,93,87,100,100]
seiseki << ["加藤美優",94,99,85,59,100]
seiseki << ["松本日向",48,49,60,74,60]
seiseki << ["三浦結衣",39,23,31,22,24]
seiseki << ["五十嵐歩",82,79,57,82,75]
seiseki << ["太田明日香",58,47,64,53,57]
seiseki << ["橋本司",51,70,71,61,54]
seiseki << ["林心春",100,100,100,64,66 ]
=end

# filename = "sample_input.csv"
filename = "class_3c_input.csv"

title = ""
File::open(filename) do |f|
	title = f.gets # 見出し
	while line = f.gets
		array = line.chop.split(',')
		(1...array.length).each do |i|
			array[i] = array[i].to_i
		end
		seiseki << array # array = ["竹内海斗", 52, 46, 36, 44, 31]
	end
end

# p seiseki

# 合計点を求めて配列に追加する
seiseki.each do | array |
	sum = 0
	(1...array.length).each do |i|
		sum += array[i].to_i
	end
	array << sum
end

# p seiseki

# ランキングの配列を生成し、nilで初期化する
ranking = Array.new(seiseki[0].length - 1).map{ Array.new(seiseki.length, nil)}
# p ranking


=begin
for i in (0...seiseki.length)
	ranking << nil
end
p ranking
=end

# seiseki[i][0]:i番目の人の氏名の文字列
# seiseki[i][j+1]:i番目の人のj番目の科目の点数
# ranking[j][i]:i番目の人のj番目の科目の順位

# すべての科目について順位をつける
(0...seiseki[0].length - 1).each do |j| # seiseki[]には、氏名のデータが含まれているので、1を引いたものが科目数
	# j番目の科目について順位をつける
	while ranking[j].count(nil) != 0 do # 順位をつけていない人がなくなるまで繰り返す

		# 順位は、総人数からまだ順位をつけていない人数(nilの数)を引けば求まる
		rank = seiseki.length - ranking[j].count(nil) + 1

		# 最高点を求める
		max_score = 0
		(0...seiseki.length).each do |i|
			if seiseki[i][j+1] > max_score # seiseki[]には、先頭に氏名のデータが含まれているので、1を足している
				max_score = seiseki[i][j+1]
			end
		end
#		p max_score

		# 最高点の人に順位をつける
		(0...seiseki.length).each do |i|
			if seiseki[i][j+1] == max_score # seiseki[]には、先頭に氏名のデータが含まれているので、1を足している
				ranking[j][i] = rank
				seiseki[i][j+1] = 0 # 次に低い点数を求めるため、順位をつけた人の点数は 0 にする
			end
		end
	end
end
# p ranking


# ランキングを画面とファイルに出力する
filename = "class_3c_output.csv"
File::open(filename, "w") do |f|
	title = title.chop + ",合計\n".encode("Windows-31J") # encodeしないとエラーになった
	print title
	f.print title
	(0...seiseki.length).each do |i|
		print seiseki[i][0] + ","
		f.print seiseki[i][0] + ","
		(0...seiseki[0].length-1).each do |j| # seiseki[]には、氏名のデータが含まれているので、1を引いたものが科目数
			print ranking[j][i].to_s
			f.print ranking[j][i].to_s
			if j != seiseki[0].length - 2 # 最後の科目ではないとき
				print ","
				f.print ","
			else
				print "\n"
				f.print "\n"
			end
		end
	end
end
