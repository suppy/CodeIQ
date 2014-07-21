# @Nabetani  鍋谷 武典さんからのアルゴリズムの問題
# 長くなるように、増え続けるように
# https://codeiq.jp/ace/nabetani_takenori/q957



n = "1234"
n = "23342020662"
n = "100000000000000000000123456789123456789123456789"
n = "16949848928757660134205746936438965754667779234288272066193900384816749587196430651049827210153585851475205217412607555474367483"
#n = "80010007000000006540065085900000008104004206001040081030501002109805001806080002304500020002064100903011000100090007009704954053"
p n
sep_num = 24

max_num = 0
#p (0...n.length-1).to_a.combination(sep_num).to_a.length
#exit

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
