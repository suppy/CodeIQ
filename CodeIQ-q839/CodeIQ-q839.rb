# The Essence of Programming  結城 浩さんからのアルゴリズムの問題
# スペーストーキー社の危機を救え！
# https://codeiq.jp/ace/yuki_hiroshi/q839



# 擬似中継基地１
def encoder(command)
	return "X" if command.length % 2 == 1 # コマンドの文字数が奇数の場合は、input は存在しない
	encoded_command = ""
	0.step(command.length-1, 2).each do |i|
		# 2文字を取り出す
		str = command[i, 2]
		break if str.length < 2 # 文字数が奇数の場合は保留
		# 1文字目の文字を、2文字目のアスキーコードから 'a'のアスキーコードを引いて 1 足した回数だけ繰り返す
		# bc → bbb
		encoded_command += str[0] * (str[1].ord - 'a'.ord + 1)
	end
	return encoded_command
end

# ファイル words.txt から正しいコマンドを読み込み、配列 words に格納する
words = []
File.open('words.txt') do |f|
	f.each_line do |line|
		words << line.chop
	end
end

# 中継基地１の input と output をハッシュ h に格納する
# 配列 words に格納されている、正しいコマンドすべてについて求める
h = {}
words.each do |word|
	input = word
	output = encoder(input)
	h[input] = output
end

# input, output の組をファイルに出力する
File.open('input-output.txt', 'w') do |f|
	h.each do |key, value|
		f.write "#{value}:#{key}\n"
	end
end




# require 'net/http'
# require 'uri'


# words = ['foo', 'ooo', 'accept', 'add', 'Add', 'aacdeapata', 'a']
# words = ['aaacccccpppppppppppppppppppp', 'aaaad']

=begin
# エコーバックモードになった encoder にアクセスするための Web API を使って、output を得る
words.each do |word|
	url = URI.parse('http://spacetalky.textfile.org/')
	res = Net::HTTP.start(url.host, url.port) do |http|
		http.get("/api.cgi?input=#{word}")
	end
	print "#{word}:#{res.body}\n"
	h[word] = res.body
	sleep 0.5
end
puts h

# input, output の組をファイルに出力する
File.open('input-output.txt', 'w') do |f|
	h.each do |key, value|
		str = key + ":" + value
		f.write "#{key}:#{value}\n"
	end
end

=end
