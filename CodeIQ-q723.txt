# Short Coder @ozy4dm  Ozyさんからの言語不問の問題
# コード美人
# https://codeiq.jp/ace/ozy4dm/q723

# Ruby（ideone.comで実行）

array = [] # 数列を格納する配列
num = 1 # 初項
while array.length < 100 do # 数列が 100個になるまで
	array << num # 3の倍数の項目を数列に追加する
	array2 = array.clone
	(0...array.length-1).each do |i|
		array2 << array[i] + num # 数列の各項に 3の倍数の項を足したものを数列に追加する
		if array2.length == 100 # 数列が100個になった場合
			break
		end
	end
	array = array2.clone
	num *= 3 # 次の 3の倍数の項
end

# 数列を表示
array.each do |i|
	p i
end
