# @Nabetani  鍋谷 武典さんからの数学の問題
# 中学入試から：数列の和
# https://codeiq.jp/ace/nabetani_takenori/q1012


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

problems = {}
File.open("data.txt", "r") do |f|
	while line = f.gets do
#		p line
		data = line.chop.split(' ')
		items = []
		data.each do |item|
			items << item
		end
		problems[data[0]] = items  
	end
end
#p problems["1000"]

#no = "T06"

# 繰り返しのパターン
def repeat_pattern(problem, series)
	(1..series.length/2).each do |i|
		sub_series = []
		(0...i).each do |j|
			sub_series << series[j]
		end
	#	p sub_series

		series_diff = []
		
		k = 0
		while k <= series.length - sub_series.length do
			(0...sub_series.length).each do |m|
				series_diff << series[k] - sub_series[m]
				k += 1
				#p series_diff
			end
		end
	#	p series_diff

		
		all_zero = true
		series_diff.each do |n|
			if n != 0
				all_zero = false
			end
		end


		if all_zero == true
			series = []
	#		while series.length < problem[no][3].to_i do
			while series.length < problem[3].to_i do
				series << sub_series
			end
			series.flatten!
	#		p series
	#		p series.length
			return series
	#		break
	#		exit
		end
		
		

	end
	return []
end

# 階差数列のパターン
def kaisa_pattern(problem, series)
	kaisa_series = []
	(1...series.length-1).each do |i|
		kaisa_series << series[i+1] - series[i]
	end
	kaisa_series.uniq!

	if kaisa_series.length == 1
		series = [series[0]]
		(0...problem[3].to_i).each do |i|
			series << series[i] + kaisa_series[0]
		end
		series.flatten!
		return series
		
	
	end
	
	return []
end

def T1_pattern(problem, series)
	if series[0] == series[3] && series[1] == series[4] && series[2] + 1 == series[5]
		series = [series[0], series[1], series[2]]
		i = 1
		while series.length < problem[3].to_i do
			series << [series[0], series[1], series[2] + i]
			i += 1
		end
		series.flatten!
		return series
		
	end
	return []
end

count_correct = 0
count_wrong = 0
problems.each do |key, problem|
no = key
correct = false
#series = problem[no][1].split(",")
series = problem[1].split(",")
(0...series.length).each do |i|
	series[i] = series[i].to_i	
end
#p series

# 繰り返しのパターン
series_complement = repeat_pattern(problem, series)

		if series_complement.length == 0
			# 階差数列のパターン
			series_complement = kaisa_pattern(problem, series)
		end

		if series_complement.length == 0
			# 階差数列のパターン
			series_complement = T1_pattern(problem, series)
		end
		
		next if series_complement.length == 0

		sum = 0
#		(problem[no][2].to_i..problem[no][3].to_i).each do |n|
		(problem[2].to_i..problem[3].to_i).each do |n|
			#p series[n]
			sum += series_complement[n - 1]
		end
#		print "#{sum} #{problem[no][4]}\n"
		print "#{problem[0]} : #{sum} #{problem[4]}\n"
		if sum == problem[4].to_i
			count_correct += 1
		else	
			count_wrong += 1 
			print "#{problem[0]}\n"
		end

#p series
end
print "#{count_correct}:#{count_wrong} #{problems.length} #{problems.length - count_correct - count_wrong}\n"

# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
