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
	num = 0
	param.length.times do |i|
		num = num * 10 + hash[param[i]]
	end
	return num
end

#
# 最上位の文字が 0 かどうかを判定する関数
#  params：覆面算の左辺文字列の配列
#  answer：覆面算の右辺の文字列
#  hash ：文字と数字の対応を格納したハッシュ
#          キー：文字
#          値 ：数字
#  返り値：
#    true ：最上位の文字が 0 の場合
#    false：最上位の文字が 0 以外の場合
#
def check_zero(params, answer, hash)
	params.each do |param|
		return true if hash[param[0]] == 0 # 最上位の文字が 0 の場合
	end
	return true if hash[answer[0]] == 0 # 最上位の文字が 0 の場合
	return false
end

#
# 覆面算の解答を表示する関数
#  params：覆面算の左辺文字列の配列
#  answer：覆面算の右辺の文字列
#  hash  ：文字と数字の対応を格納したハッシュ
#          キー：文字
#          値 ：数字
#
def display_alphametic(params, answer, hash)
	# 覆面算の左辺を表示する
	params.each_with_index do |param, i|
		param.length.times do |j|
			print hash[param[j]]
		end
		if i != params.length - 1
			print " + "
		end
	end

	print " = "

	# 覆面算の右辺を表示する
	answer.length.times do |i|
		print hash[answer[i]]
	end
	print "\n"
end


# READ + WRITE + TALK = SKILL
# 覆面算の左辺の文字列
params = ["READ", "WRITE", "TALK"]
# 覆面算の右辺の文字列
answer = "SKILL"

# 覆面算で使用されている文字を配列 char に格納する（重複なし）
char = (params.each.collect { |param| param.split('') }).flatten | answer.split('')
# 0～9の数字を配列 number に格納する
number = (0..9).collect { |i| i }

# 覆面算が当てはまる組み合わせの数
set = 0

# 文字と数字の対応を格納するハッシュ hash
hash = {}

# 使用している文字の数の順列を生成し、処理を行う
number.permutation(char.length) do |pattern|

	# 文字と数字の対応をハッシュ hash に追加する
	char.length.times do |i|
		hash[char[i]] = pattern[i]	
	end

	# 最上位の文字が 0 の場合は、次の順列の処理にジャンプする
	next if check_zero(params, answer, hash)
	
	# 覆面算の左辺を計算する
	num = 0
	params.each do |param|
		num += char2num(param, hash)
	end
	
	# 覆面算に当てはまる組み合わせの場合
	if char2num(answer, hash) == num
		# 覆面算の解答を表示する
		display_alphametic(params, answer, hash)
		# 組み合わせの数をインクリメントする
		set += 1
	end
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
