# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：3つのグラスでの移動
# https://codeiq.jp/ace/thisweek_masuipeo/q879

# A, B, C の容量の組み合わせを格納する配列
@glassesVolSet = []

# 互いに素な数字の組を求める
# BとCの容量は「互いに素」な2つの数で、B+C=A, B>Cを満たすものとします。
# Aの容量を10以上100以下の偶数
10.step(100, 2).each do |a|
	((a/2)..(a-1)).each do |b|
		c = a - b
		next if b.gcd(c) != 1
#		print "a=#{a}, b=#{b}, c=#{c}\n"
		@glassesVolSet << [a, b, c]
	end
end
# p @glassesVolSet.length

#
# グラスからグラスへ水を移す処理を行う関数
#  引数
#    glasses:３つのグラスの水の量(配列)
#    glass1 :移動元のグラス　A -> 0, B -> 1, C -> 2  
#    glass2 :移動先のグラス　A -> 0, B -> 1, C -> 2
#  返り値
#    移したあとの３つのグラスの水の量(配列)
#
def moveWater(glasses, glass1, glass2)
	# 移動先のグラスへ水を移すとあふれるか
	if glasses[glass1] > @glassesVol[glass2] - glasses[glass2]
		glasses[glass1] -= @glassesVol[glass2] - glasses[glass2]
		glasses[glass2]  = @glassesVol[glass2]
	else
		glasses[glass2] += glasses[glass1]
		glasses[glass1]  = 0
	end
#	return glasses
end


#
# Aに残る量が最初の半分になったか
#
def isHalf(glasses)
	return true if glasses[0] * 2 == @glassesVol[0]
	return false
end


# 求める個数
count = 0
# A, B, C の組み合わせそれぞれについて処理を行う
@glassesVolSet.each do |glassesVol|
#	p glassesVol
	
	# 移動によって出現する、A, B, Cの組み合わせの集合
	# Aに水が満たされていて、BとCが空であるところから始める
	glassesSet = [[glassesVol[0], 0, 0]]
	
	# グローバル変数に[A, B, C]を代入
	@glassesVol = glassesVol
	#@glassesVol = [8, 5, 3]

	# n番目の手順
	# n = 1
	is_break = false # 多重ループを抜けるためのフラグ
	loop do
		glassesArray = [] # 移動によって出現する、A, B, Cの組み合わせの集合を初期化
		# これまでの移動で出現したA, B, Cの組み合わせそれぞれについて処理を行う
		glassesSet.each do |glasses|
			# p glasses
			# グラスを２つ選んで処理を行う
			(0..2).to_a.permutation(2) do |p1, p2|
				glassesBefore = glasses.clone
				# 水を移動する
				moveWater(glassesBefore, p1, p2)
				# 水が半分になったとき
				if isHalf(glassesBefore)
					# 求める個数をインクリメント
					count += 1
					# print "#{n}回目\n"
					# p glassesBefore
					# breakする
					is_break = true
					break
				end
				# 組み合わせの集合に追加する
				glassesArray << glassesBefore
			end
			#p glassesArray
			break if is_break # 多重ループを抜ける
		end
		break if is_break # 多重ループを抜ける
		# 移動前と移動後の組み合わせの数が同じときは、これ以後に、水が半分になることはない
		if glassesSet.length == (glassesSet | glassesArray).length
			puts "not found"
			break
		end
		# 移動前の組み合わせに、移動後の組み合わせを追加する（重複なし）
		glassesSet |= glassesArray

		# p glassesSet
		# n += 1
	end
end
p count