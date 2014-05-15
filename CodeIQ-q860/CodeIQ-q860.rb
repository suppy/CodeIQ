# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：覆面算を満たす個数
# https://codeiq.jp/ace/thisweek_masuipeo/q860

# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"


#
# 覆面算の文字列を数値に変換する関数
#  param：覆面算の文字列
#  hash ：文字と数字の対応を格納したハッシュ
#          キー：文字
#          値 ：数字
#  返り値：覆面算の文字列を変換した数値
#
def char2num(param, hash)
# p param
# p hash
	num = 0
	param.length.times do |i|
#		print "num*10=#{num*10}\n"
# 		print "i=#{i} param[#{i}]=#{param[i]} h=#{hash[param[i]]}\n"
		num = num * 10 + hash[param[i]]
#		print "h=#{hash[param[i]]}\n"
#		p num
	end
	return num
end

#
# 覆面算の解答を表示する関数
#
def display_alphametic(param1, param2, param3, answer, h)
	param1.length.times do |i| print h[param1[i]] end
	print " + "
	param2.length.times do |i| print h[param2[i]] end
	print " + "
	param3.length.times do |i| print h[param3[i]] end
	print " = "
	answer.length.times do |i| print h[answer[i]] end
	print "\n"
end


# READ + WRITE + TALK = SKILL

param1 = "READ"
param2 = "WRITE"
param3 = "TALK"
answer = "SKILL"

# 覆面算で使用されている文字を配列 char に格納する
char = param1.split('') | param2.split('') | param3.split('') | answer.split('')
# 0～9の数字を配列 number に格納する
number = (0..9).collect {|i|i}

# p char
# p number
h = {}
h_answer = []

# 覆面算が当てはまる組み合わせの数
set = 0
# 使用している文字の数の順列を生成し、処理を行う
number.permutation(char.length) do |a|
	# 文字と数字の対応をハッシュ h に追加する
	char.length.times do |i|
		h[char[i]] = a[i]	
	end
	# 最上位の文字が 0 の場合は、次の順列の処理にジャンプする
	next if h[param1[0]] == 0 || h[param2[0]] == 0 ||
			h[param3[0]] == 0 || h[answer[0]] == 0
	# p h
	# p char2num(param1, h)
	# exit
#	p h
	# 覆面算に当てはまる組み合わせの場合
	if char2num(answer, h) == char2num(param1, h) + char2num(param2, h) + char2num(param3, h)
		p h
		display_alphametic(param1, param2, param3, answer, h)
		# 組み合わせの数をインクリメントする
		set += 1
		
	end
#	exit
end
# 解答の表示
puts "覆面算"
puts "READ + WRITE + TALK = SKILL"
print "を満たすような当てはめ方は#{set}通り\n\n"


# 処理終了時刻
t1 = Time.now
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
