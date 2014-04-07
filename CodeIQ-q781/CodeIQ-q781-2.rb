# The Essence of Programming  結城 浩さんからのアルゴリズムの問題
# クリプタン帝国の暗号文を解読しよう！
# https://codeiq.jp/ace/yuki_hiroshi/q781

# cryptan2.txt
# 暗号文2

# N.B. SHA-1 ALGORITHM IS USED FOR H AND R.

require 'digest/sha1'


filename = "cryptan2.txt"

passphrase = "Hello, world!"
# key = []

e_i = []

File.open(filename) do |f|
	while l = f.gets # ファイルから一行読み込む
		0.step(l.length-2, 3) do |i| # 一行の終わりまで処理
			e_i << l[i, 2].downcase
		end
	end
end
# p e_i
# p e_i.length

#
# 16進数を表す 2桁の文字列を 10進数の数値に変換する
#
def hex_to_i(hex)
#	p hex
	# 16進数の文字を 10進数の数値に変換するハッシュ
	h = {	"0" => 0,
			"1" => 1,
			"2" => 2,
			"3" => 3,
			"4" => 4,
			"5" => 5,
			"6" => 6,
			"7" => 7,
			"8" => 8,
			"9" => 9,
			"a" => 10,
			"b" => 11,
			"c" => 12,
			"d" => 13,
			"e" => 14,
			"f" => 15,
			" " => 0,
		}
	hex = hex.downcase 

	return h[hex[0]] * 16 + h[hex[1]] # 10進数に変換
end


(0..255).each do |i|
	seed = "0" + i.to_s(16)
	seed = seed[-2, 2]
	k_i_1 = seed
#	p e_i[0]
#	p k_i_1
	hex = (hex_to_i(e_i[0]) ^ hex_to_i(k_i_1)).chr
	print "#{i}:#{hex} "
	(1...560).each do |i|
		k_i = Digest::SHA1.hexdigest(k_i_1.upcase)
		k_i = k_i[-2, 2]
		hex = hex_to_i(e_i[i]) ^ hex_to_i(k_i)
		if hex >= 32 and hex <= 126
			print "#{hex.chr} "
		else
			break
		end
		k_i_1 = k_i
	end
	print "\n"
end

exit

# ハッシュ関数
seed = Digest::SHA1.hexdigest(passphrase)
# p seed
# key << seed

# K[0] := S mod 256
key = [ seed[seed.length-2, 2] ] 
(1..560).each do |i|
#	print "#{i}\n"

	# K[i] := R(K[i-1]) mod 256 
	key_i = Digest::SHA1.hexdigest( key[i-1] )
	key << key_i[key_i.length-2, 2]
end
=begin
key.each do |k|
	print "#{k}\n"
end
=end

p key


=begin
key.each do |k|
	print "#{hex_to_i(k)}\n"
end
=end


# ファイル内の 16進表示の文字を、配列 hex_char に格納する
File.open(filename) do |f|
	while l = f.gets # ファイルから一行読み込む
		0.step(l.length-2, 3) do |i| # 一行の終わりまで処理
#			print "#{key[(i / 3).floor]} ^ "
#			print "#{l[i, 2]}\n"
#			print "#{hex_to_i(key[(i / 3).floor])} ^ #{hex_to_i(l[i, 2])}\n"
#			print hex_to_i(key[(i / 3).floor]) ^ hex_to_i(l[i, 2])

			# T[i] xor K[i]
			hex = (hex_to_i(key[(i / 3).floor]) ^ hex_to_i(l[i, 2])).to_s(16)
			hex = ("0" + hex)[hex.length-1, 2]

			print "#{hex.upcase} "



		end
		print "\n"
	end
end

exit

hex_char = [] # ファイル内にある16進表示の文字を格納する配列
# ファイル内の 16進表示の文字を、配列 hex_char に格納する
File.open(filename) do |f|
	while l = f.gets # ファイルから一行読み込む
		0.step(l.length-2, 3) do |i| # 一行の終わりまで処理
			hex_char << l[i, 2] # 16進表示の文字を配列に追加
		end
	end
end


h = {} # 各文字の個数を格納するハッシュ
# 16進表示の文字数を、文字ごとに数える
hex_char.each do |e_i|
	if h[e_i] == nil # ハッシュになければ、1に設定
		h[e_i] = 1
	else             # ハッシュにあれば、インクリメント
		h[e_i] += 1
	end
end

# 各文字の個数を昇順に表示する
print "#{filename}に含まれる各文字の個数を昇順に表示\n"
(h.sort { |a, b| a[1] <=> b[1] }).each do |item|
	print "#{item[0]} -> #{item[1]}\n"
end
print "\n"

# 復号用のハッシュ
decryptan = {
	# 文字を推測した順番に、復号した ASCII文字を記述していく
	
    # まず、暗号解読ということで、"The Adventure of the Dancing Men" が頭に浮かぶ
	# 「暗号前の文章はASCII コードで書かれた」ということなので、英語の文章と推測
	# 個々の 16進表示をアルファベットと記号に変換することを考えてみる

	"CB" => " ", # cryptan1.txtを眺めていて、CB の数が多いようなので、
				 # 実際にプログラムを作成して数えてみると、CB の数が突出している
				 # CB の配置を見ると、単語の区切りの半角スペースと推測するのが妥当と判断
				 # ただ、17行目に CB CB と並んでいるのが気になる
	"9C" => "e", # アルファベットのうち、使用頻度が高いのは e と言われている
				 # 頻度分析 (暗号)
				 # http://ja.wikipedia.org/wiki/%E9%A0%BB%E5%BA%A6%E5%88%86%E6%9E%90_(%E6%9A%97%E5%8F%B7)
				 # 9C は e と推測
				 # シャーロック・ホームズもここから始めた
	"F0" => "a", # 27行目、29行目に F0 だけの単語になっているものがあるので、a と断定
				 # 単語内で同じ文字が 2つ並ぶ可能性があるアルファベットを考えてみる
				 # dd, ee, ff, gg, ll, mm, oo, pp, rr, ss, tt, zz
	"97" => "l", # 20行目に a 97 97 という単語があり、97 は l と推測
	"0D" => "s", # 9行目に CD  l  a 0D 0D という単語があり、0D 0D で終わるので、s と仮定
				 # s と仮定して復号してみて、全体的に見てみると、不自然ではないように感じる
	"E4" => "m", # 40行目の s E4 a  l  l という単語があり、
				 # E4 の個数は少ないので、考えられるアルファベットから m と仮定して試してみる
	"24" => "n", # 33行目に a 24 という単語があり、24 は n と推測
	"7D" => "d", # a  n 7D という単語が、5行目、16行目、22行目、25行目、36行目と頻出しているので、
				 # and という単語と推測して、7D は d と推測
	"1C" => "r", # 8行目の a  d  d 1C  e  s  s C2  n 08 という単語から、1C は r と推測
				 # 単語が少しずつ見えてきたので、楽しくなる
	"2C" => "y", # 10行目の r  e  a  l  l 2C という単語から、2C は y と推測
				 # 1行目の m 2C という単語が my となったので、E4 を m とした仮定は正しいと判断
				 # 78 が最初と最後に出てくるが、" かと思いつつ保留
	"50" => ".", # 最後の 78 の前が 50 であり、50 が必ず単語の終わりになっているようなので、50 は . と推測
	"58" => "u", # 38行目の s 58  r  e という単語から、58 は u と推測
	"DA" => "o", # 35行目、40行目の y DA  u  r、38行目の y DA  u という単語から、DA は o と推測
	"F9" => "f", # 34行目の o F9 という単語から、F9 は f と推測
	"3F" => "p", # 39行目の 3F  r  o 3F  o  s  e という単語から、3F は p と推測
	"BA" => "t", # 22行目の p  r  e  s  e  n BA  s という単語から、BA は t と推測
				 # 10行目の d C2  f  f C2 CD  u  l  t という単語は、difficult と判断
	"C2" => "i", # C2 は i と推測
	"CD" => "c", # CD は c と推測
	"21" => ",", # 25行目の c o  n  c  l  u  s  i  o  n 21 などから、21 は , と推測
				 # このあたりになると、推測ではなく断定して解読作業を実施
				 # 気分は、シャーロック・ホームズになった感じ
				 # となると、2行目の CE  a  t  s  o  n は、Watson なのか！！
	"4D" => "h", # 4D は h と断定
	"08" => "g", # 08 は g と断定
	"D3" => "b", # 35行目の後半からの文章で、37行目の t  h  u  m D3 という単語から、D3 は b と断定
	"07" => "w", # 07 は w と断定
	"A9" => "k", # A9 は k と断定
	"7F" => "v", # 7F は v と断定
	"25" => "-", # 25 は - と断定
	"AB" => "Y", # AB は Y と断定
	"C5" => "'", # C5 は ' と断定
	"78" => "\"",# 78 は " と断定
				 # CE は W かなあ、88 は N かなあ
				 # 英訳してみれば後は分かりそうだなあ
				 # ちょっと試しに、
				 # 『Sherlock Holmes: The Complete Collection
				 #  (4 Novels, 56 Short Stories, and Exclusive Bonus Features)』 Kindle版
				 # で全文検索してみよう。
				 # キーワードは、addressing にしてみよう。
				 # 同じの文章が見つかった！！！
				 # 作品名は。。。
				 # "The Adventure of the Dancing Men"！！！！！！
				 # 以下、原文と照らし合わせて
	"CE" => "W",
	"B7" => "I",
	"88" => "N",
	"AC" => "O",
	"9D" => "T"
				 # この場面か、と思いつつ、ジェレミー・ブレッドの『踊る人形』を見る
}

# 文章を復元して表示する
print "復元した文章\n"
File.open(filename) do |f|
	while l = f.gets # ファイルから一行読み込む
		0.step(l.length-2, 3) do |i| # 一行の終わりまで処理
			if decryptan[l[i, 2]] == nil # 分からない文字はそのまま表示
				print l[i, 2]
			else
				print "#{decryptan[l[i, 2]]}" # 復号して表示
			end
		end
	end
end
