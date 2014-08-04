# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：グレイコードのループ
# https://codeiq.jp/ace/thisweek_masuipeo/q998


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"



hex_start = "808080"
hex_start = "abcdef"
hex = hex_start
count = 0
loop do

	gray_code = ""
	(1...hex.length).each do |i|
		# グレイコードのi桁目は、元の数値のi桁目の数値からi+1桁目の数値を引いた値になる
		# なお、引いた値が負にならないように、0x10を足して、全体を0x10で割った余りを計算することで求める
		gray_code = ((hex[-i].to_i(16) - hex[-1-i].to_i(16) + 0x10) % 0x10).to_s(16) + gray_code
	end
	# グレイコードの最上位桁は、元の数値の最上位桁と同じにする
	gray_code = hex[0] + gray_code

	count += 1

	# print "#{hex} -> #{gray_code}\n"
	
	# 最初の数値と同じになればループを抜ける
	break if gray_code == hex_start

	# 数値を更新する
	hex = gray_code
end
p count	

exit
#hex_start = "808080"
#hex = hex_start
#loop do
(16..0x201).each do |i|
	hex = i.to_s(16)
	gray_code = ""
	(0...hex.length).each do |j|
		gray_code[i] = (hex[j-1].to_i(16) - hex[j-2].to_i(16)).to_s(16) 
	
	end
	print "#{hex} -> #{gray_code}\n"

	
=begin
	
	gray_code = (hex.to_i(16) - (hex.to_i(16) >> 4)).to_s(16)
	if hex.length != gray_code.length
		gray_code = hex[0] + gray_code
	end
	if hex[0] != gray_code[0]
		gray_code[0] = hex[0]
	end
	print "#{hex} -> #{gray_code}\n"
	if gray_code == hex_start
		print "end\n"
		break
	end
=end
	hex = gray_code
end








# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
