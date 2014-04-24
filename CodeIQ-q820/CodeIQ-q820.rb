# @Nabetani  鍋谷 武典さんからのゲームの問題
# 4つの数と四則と括弧
# https://codeiq.jp/ace/nabetani_takenori/q820

# 演算関数
#  param1,param2:数値
#  ope          :演算子の文字
#                ' 'の場合は、param1 と param2 の数で 2 桁の数値を作る
def calc(param1, ope, param2)
	case ope
	when '+'
		return param1 + param2
	when '-'
		return param1 - param2
	when '*'
		return param1 * param2
	when '/'
		return param1.to_f / param2.to_f
	when ' '
		return param1 * 10 + param2
	else
	
	end
end

# 与えられた数字を格納した配列
number = [2, 3, 7, 8]

# 数字から順列を作って、すべてのパターンを配列 numbers に格納する
numbers = number.permutation.to_a

# 演算子
# 半角スペースは、2つの数字で、2桁の数字を作ることを意味する
operator = ['+', '-', '*', '/', ' ']
# 演算子を３つ選択する（重複順列）ときのすべてのパターンを配列 operators に格納する
operators = operator.repeated_permutation(3).to_a

# 作ることができた数を格納する配列
made_num = []

# 個々の数字の順列について処理を行う
numbers.each do |num|
	# num は [a, b, c, d] という形式の配列
	
	# 個々の演算子の重複順列について処理を行う
	operators.each do |ope|
		# ope は [★, ★, ★] という形式の配列（★は演算子の文字を表す）
		
		# num と ope を組み合わせて、次のような数式を考える
		# num[0] ope[0] num[1] ope[1] num[2] ope[2] num[3]
		# a ★ b ★ c ★ d
		
		# 括弧を挿入する位置によって場合分けして、計算する
		# 計算で作ることができた数字は、配列 made_num に格納する
		
		# ((a★b)★c)★d の形式
		if ope[1] != ' ' && ope[2] != ' ' # ' 'が使えるのは、a★bの部分の演算子のみ
			value = calc(calc(calc(num[0], ope[0], num[1]), ope[1], num[2]), ope[2], num[3])
			made_num << value
		end

		# (a★(b★c))★d の形式
		if ope[0] != ' ' && ope[2] != ' ' # ' 'が使えるのは、b★cの部分の演算子のみ
			value = calc(calc(num[0], ope[0], calc(num[1], ope[1], num[2])), ope[2], num[3])
			made_num << value
		end

		# a★((b★c)★d) の形式
		if ope[0] != ' ' && ope[2] != ' ' # ' 'が使えるのは、b★cの部分の演算子のみ
			value = calc(num[0], ope[0], calc(calc(num[1], ope[1], num[2]), ope[2], num[3]))
			made_num << value
		end

		# a★(b★(c★d)) の形式
		if ope[0] != ' ' && ope[1] != ' ' # ' 'が使えるのは、c★dの部分の演算子のみ
			value = calc(num[0], ope[0], calc(num[1], ope[1], calc(num[2], ope[2], num[3])))
			made_num << value
		end

		# (a★b)★(c★d) の形式
		if ope[1] != ' ' # ' 'が使えるのは、a★b と c★dの部分の演算子のみ
			value = calc(calc(num[0], ope[0], num[1]), ope[1], calc(num[2], ope[2], num[3]))
			made_num << value
		end
		
		# abc★d の形式
		if ope[0] == ' ' && ope[1] == ' ' # a★b★c の演算子がどちらも' 'であれば、
											# abc という 3 桁の数字として計算にできる
			value = calc(calc(calc(num[0], ope[0], num[1]), ope[1], num[2]), ope[2], num[3])
			made_num << value
		end

		# a★bcd の形式
		if ope[1] == ' ' && ope[2] == ' ' # b★c★d の演算子がどちらも' 'であれば、
											# bcd という 3 桁の数字として計算にできる
			value = calc(num[0], ope[0], calc(num[1], ope[1], calc(num[2], ope[2], num[3])))
			made_num << value
		end
		
	end
end

# 1～99のうちで、作ることができなかった数を表示する
# （配列 made_num に含まれていない数）
(1..99).each do |i|
	print "#{i}," if made_num.include?(i) == false
end
