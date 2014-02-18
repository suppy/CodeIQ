# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：カードを裏返して！

# カードを表す配列
card = []

# カードの配列の初期化
# 表：true
# 裏：false
101.times do
	card << false
end

# jが i番目のカードの約数の場合は、裏返す
for i in (2..100)
	for j in (2..i)
		if i % j == 0
			card[i] = !card[i]
		end
	end

end

# 裏になっているカードを表示
for i in (1..100)
	if card[i] == false
		p i
	end
end
