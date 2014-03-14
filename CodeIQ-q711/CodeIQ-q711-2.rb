# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：運命の出会いは何通り？
# https://codeiq.jp/ace/thisweek_masuipeo/q711

# マス目のサイズ
SIZE = 6

# 「運命の出会い」の場合の数（グローバル変数）
$encounter_num = 0

#
# 「運命の出会い」になっているかを判定
#  mx, my:男性の座標：（mx, my)
#  wx, wy:女性の座標：（wx, wy)
#  encounter:これまでに「運命の出会い」があったかを保持している
#    0:出会っていない
#    1:横の同一直線上の頂点で同時に止まることが発生した
#    2:縦の同一直線上の頂点で同時に止まることが発生した
#    3:同じ頂点で出会った、または、同一直線内の頂点に同時に止まることが２度発生した
#
def check_encounter(mx, my, wx, wy, encounter)
	# 男女ともゴールに到着した場合
	if mx == SIZE and my == SIZE and wx == 0 and wy == 0
		# 「運命の出会い」があった場合
		if encounter == 3
			$encounter_num += 1
		end
	else
		# 同じ頂点で出会った場合
		if mx == wx and my == wy
			encounter = 3
		# 横の同一直線上の頂点で同時に止まることが発生した場合
		elsif mx == wx
			encounter |= 1 # 男女とも同一直線上を移動する場合があるので、ORをとっている
		# 縦の同一直線上の頂点で同時に止まることが発生した場合
		elsif my == wy
			encounter |= 2 # 男女とも同一直線上を移動する場合があるので、ORをとっている
		end
		# 横と縦でORをとることで、両方が発生した場合に、3（「運命の出会い」）となる

		# 男性、女性の次の動作を決定する
		# 男性：右、女性：左 に移動
		if mx < SIZE and wx > 0
			check_encounter(mx + 1, my, wx - 1, wy, encounter)
		end
		# 男性：下、女性：左 に移動
		if my < SIZE and wx > 0
			check_encounter(mx, my + 1, wx - 1, wy, encounter)
		end
		# 男性：下、女性：上 に移動
		if my < SIZE and wy > 0
			check_encounter(mx, my + 1, wx, wy - 1, encounter)
		end
		# 男性：右、女性：上 に移動
		if mx < SIZE and wy > 0
			check_encounter(mx + 1, my, wx, wy - 1, encounter)
		end
	end
end

# 初期状態から動作開始
# 男性の座標：A：(0、0)
# 女性の座標：B：（SIZE, SIZE)
# 「運命の出会い」：0（出会っていない）
check_encounter(0, 0, SIZE, SIZE, 0)

print "「運命の出会い」は#{$encounter_num}通り"
