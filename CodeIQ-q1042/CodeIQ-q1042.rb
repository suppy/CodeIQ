# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：いまだに現金払い？
# https://codeiq.jp/ace/thisweek_masuipeo/q1042


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

coins = [10, 50, 100, 500]
coin_sets = []

count = 0
(2..15).each do |i|
	coins.repeated_combination(i).to_a.each do |coin_set|
		money = 0
		coin_set.each do |coin|
			money += coin
		end
		if money == 1000
			count += 1
			#coin_sets << coin_set
		end
	end

end
p count
#p coin_sets

# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
