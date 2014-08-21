# @Nabetani  鍋谷 武典さんからの数学の問題
# 中学入試から：数列の和
# https://codeiq.jp/ace/nabetani_takenori/q1012


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

# ファイルから問題を読み込む
problems = []
File.open("data.txt", "r") do |f|
	while line = f.gets do
		data = line.chop.split(' ')
		problem = []
		data.each do |column|
			problem << column
		end
		problems << problem  
	end
end

count_correct = 0
count_wrong = 0
wrong_answer = []

problems.each do |problem|

	# 問題から数列を取り出す
	series = problem[1].split(",")
	(0...series.length).each do |i|
		series[i] = series[i].to_i	
	end

	(1..series.length).each do |i|
		# 数列をi番目おきの数列に分割する
		# [n_1, n_1+i, n_1+2*i, ...]
		# [n_2, n_2+i, n_2+2*i, ...]
		# [n_3, n_3+i, n_3+2*i, ...]
		# ..........................
		# [n_i, n_2*i, n_3*i,   ...]
		series_sub = []
		(0...series.length).each do |j|
			series_sub[j % i] = []
		end
		(0...series.length).each do |j|
			series_sub[j % i] << series[j]
		end
		
		# 分割した数列の階差を格納する配列
		diff = []

		kaisa = true
		i = 0
		# 分割した各数列について処理を行う
		series_sub.each do |series_sub_item|
			# 各数列が階差数列になっている場合、階差を配列に格納する
			(2...series_sub_item.length).each do |j|
				if series_sub_item[j-1] - series_sub_item[j-2] == series_sub_item[j] - series_sub_item[j-1]
					diff[i] = series_sub_item[1] - series_sub_item[0]
				else
					kaisa = false
					break
				end
			end
			break if kaisa == false	
			i += 1
		end

		# 各数列のすべてが階差数列になっている場合
		if kaisa == true
			# 数列を生成
			series_comp = []
			# [n_1, ... , n_i]を設定
			(0...series_sub.length).each do |i|
				series_comp << series_sub[i][0]
			end

			# [n_1+i, ...]を設定
			(series_sub.length...problem[3].to_i).each do |i|
				series_comp << series_comp[i%series_sub.length + ((i/series_sub.length).floor-1) * series_sub.length] + diff[i%series_sub.length]
			end
			
			# 和を求める
			sum = 0
			(problem[2].to_i..problem[3].to_i).each do |i|
				sum += series_comp[i-1]
			end

			# 「期待する答え」と等しいか
			if sum == problem[4].to_i
				count_correct += 1
			else
				#print "#{problem[0]} #{sum} #{problem[4]}\n"
				count_wrong += 1
				wrong_answer << problem[0]
			end
			break
		end
	end
end
#print "#{count_correct}:#{count_wrong} #{problems.length} #{problems.length - count_correct - count_wrong}\n"
print wrong_answer.join(",")


# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
