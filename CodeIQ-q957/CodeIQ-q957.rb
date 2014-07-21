# @Nabetani  鍋谷 武典さんからのアルゴリズムの問題
# 長くなるように、増え続けるように
# https://codeiq.jp/ace/nabetani_takenori/q957



n = "1234"
n = "23342020662"
n = "100000000000000000000123456789123456789123456789"

max_num = 0
["", "|"].repeated_permutation(n.length-1).each do |pattern|
	#p pattern
	#n_arr = n.split('')
	series_str = ""
	(0...pattern.length).each do |i|
		series_str += n[i] + pattern[i]
	end
	series_str += n[-1]
	#p series
	series = series_str.split('|')
	#p series
	is_asc = true
	(0...series.length-1).each do |i|
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
