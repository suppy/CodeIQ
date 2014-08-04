# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：縦横の合計から特定
# https://codeiq.jp/ace/thisweek_masuipeo/q982

# n行n列の行列
n = 4

# 縦横の合計のパターンをキーとするハッシュ
# パターンの個数を値とする
count_pattern_h = {}

# n行n列の行列のすべてのパターンについて処理を行う
# ×→0、○→1をする
[0, 1].repeated_permutation(n).to_a.repeated_permutation(n).to_a.each do |pattern|
	# カウントした数字の並び順を格納する配列
	count_pattern = []

	# 各行の個数を数えて、カウントした数字の並び順の配列に格納する
	(0...n).each do |i|
		count = 0
		(0...n).each do |j|
			count += pattern[i][j] 	
		end
		count_pattern << count
	end
	
	# 各列の個数を数えて、カウントした数字の並び順の配列に格納する
	(0...n).each do |i|
		count = 0
		(0...n).each do |j|
			count += pattern[j][i]	
		end
		count_pattern << count
	end

	# カウントした数字の並び順の配列をハッシュのキーにして、
	# カウントした数字の並び順の配列の個数を数え、それをハッシュの値にする
	if count_pattern_h[count_pattern] == nil
		count_pattern_h[count_pattern] = 1
	else
		count_pattern_h[count_pattern] += 1
	end
end

# ハッシュから、一通りにしか配置できない行列の個数を求める
num = 0
count_pattern_h.each do |key, value|
	num += 1 if value == 1
end
p num
