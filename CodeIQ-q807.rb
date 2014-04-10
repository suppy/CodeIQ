# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：美しい？IPアドレス
# https://codeiq.jp/ace/thisweek_masuipeo/q807


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

#
# 0から255の数値について、2進数にしたとき、「左右対称」となる数値を求める
# そして、求まった 2つの数値の組で、使われている数字が重複していない組を配列に格納する
#

# 「左右対称」となる数値の組を格納する配列 symmetryを初期化
symmetry = []

(0..255).each do |num1_base10|
	# 2進数に変換する（先頭の 0は除かない）
	num1_base2 = ("0" * 7 + num1_base10.to_s(2))[-8, 8]

	# 「左右対称」となる数値
	num2_base2 = num1_base2.reverse
	num2_base10 = num2_base2.to_i(2)

	# 2つの数値で使われている数字を配列 num_arrayに格納する（重複あり）
	num_array = (num1_base10.to_s + num2_base10.to_s).split("")
	# 重複がなかった場合
	if num_array.uniq.length == num_array.length
		# 「左右対称」となる数値の組を配列に格納する
		symmetry << [num1_base10, num2_base10]
		# print "#{num1_base10}:#{num1_base2} -> #{num2_base2}:#{num2_base10}\n"
	end
end
# p symmetry

#
# 「左右対称」となる数値の組を 2つ選び、使われている数字が重複していない組み合わせを求める
# そして、IPアドレスを作成して配列に格納する
#

# IPアドレスを格納する配列
ip = []
# 「左右対称」となる数値の組を 2つ選んで処理を行う
symmetry.permutation(2) do |pair1, pair2|
	# 2つの数値の組で使われている数字を配列 num_arrayに格納する（重複あり）
	num_array = (pair1[0].to_s + pair1[1].to_s + pair2[0].to_s + pair2[1].to_s).split("")
	# 重複がなかった場合
	if num_array.uniq.length == num_array.length
		# print "#{pair1}, #{pair2}\n"
		
		# IPアドレスを作成する
		# 以下の順番で並べると、「左右対称」な IPアドレスとなる
		#    ┏━━━━━━━━━━左右対称━━━━━━━━━━━┓
		# pair1[0].pair2[0].pair2[1].pair1[1]
		#           ┗━━左右対称━━┛
		
		# 作成した IPアドレスを配列に格納する
		ip << pair1[0].to_s + "." + pair2[0].to_s + "." + pair2[1].to_s + "." + pair1[1].to_s
	end
end

=begin
# IPアドレスを表示する
ip.each do |address|
	print "#{address}\n"
end
=end

# IPアドレスの個数を表示する
print "条件に当てはまるIPアドレスの個数\n"
p ip.length
print "\n"



# 処理終了時刻
t1 = Time.now
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
