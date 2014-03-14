# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：サイコロの反転
# https://codeiq.jp/ace/thisweek_masuipeo/q735


# 次の状態のサイコロの目の並びを求める
#  dices:現在のサイコロの目の並びを表す整数
#  返り値：次の状態のサイコロの目の並びを表す整数
def next_dices(dices)
	dices = dices.to_s
	n = dices[0].to_i # １個目のサイコロの目
	sub_dices = dices.slice!(0, n) # １個目のサイコロの目の個数分、サイコロの目を取り出す
	(0...sub_dices.length).each do |i|
		dices += (7 - sub_dices[i].to_i).to_s # サイコロの目を裏返して後ろにつける
	end
	
	return dices.to_i
end

=begin
next_dices(123456)
dices = 623456
dices = next_dices(dices)
p dices
dices_array = Array.new(10, 0)
p dices_array

# exit
=end
count = 0
arr = []
dices_array = Array.new(666666 + 1, 0)
(111111..666666).each do |dices|
 p i if i % 111111 == 0
	next if i.to_s =~ /[7890]/ # サイコロの目に 7890の文字が含まれていた場合
#	p "init array"

	# サイコロの目 iが作業中に何度登場したかを表す配列
	# dices_array[i]
	#      ０：登場していない
	#      1：１度登場した
	#      2：ループの中に入っている
	#      3：ループの２周目
	# 初期化
	dices_array = Array.new(666666 + 1, 0)
#	p "done"
	
# print "#{i}:"
	
#	break if i == 616162
	# p i
#	dices_array[i] += 1
#	dices = i
	dices_array[dices] += 1
	loop do
		dices = next_dices(dices) # サイコロをルールに従って動かす
		# p dices
		dices_array[dices] += 1
		break if dices_array[dices] == 3 # ループの２周目の場合
	end
	count = dices_array.count(1) # ループの中に入らない目の個数
	
	if count > 0
		
		count.times do
			arr << dices_array.index(1) # ループに入っていない目を arrに格納
			dices_array[dices_array.index(1)] = 0 # 次のループに入っていない目を求めるため、今の要素を 0にする
		end
=begin	
		(111111..666666).each do |j|
			next if j.to_s =~ /[7890]/
			if dices_array[j] == 1
				arr << j
			end
		end
=end
	end
#	print "#{count}\n"
end

# p count
# p arr.sort.uniq
p arr.sort.uniq.length

exit

p dices_array.count(1)
print "111112:#{dices_array[111112]}\n"
print "132564:#{dices_array[132564]}\n"
print "325646:#{dices_array[325646]}\n"
print "616161:#{dices_array[616161]}\n"
