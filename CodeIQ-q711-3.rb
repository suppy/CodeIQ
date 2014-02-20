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

		# 男性、女性の次の動作を格納した配列
		# [男性の横方向の移動距離, 男性の縦方向の移動距離, 女性の横方向の移動距離, 女性の縦方向の移動距離]
		moves = [[1, 0, -1, 0], # 男性：→、女性：←
				 [1, 0, 0, -1], # 男性：→、女性：↑
        		 [0, 1, -1, 0], # 男性：↓、女性：←
				 [0, 1, 0, -1]]	# 男性：↓、女性：↑ 
		# 各動作について「運命の出会い」の判定を行う
		moves.each do |move|
			dmx = move[0] # 男性の横方向の移動距離
			dmy = move[1] # 男性の縦方向の移動距離
			dwx = move[2] # 女性の横方向の移動距離
			dwy = move[3] # 女性の縦方向の移動距離

			# 男性、女性が移動した先での「運命の出会い」の判定
			if mx + dmx <= SIZE and my + dmy <= SIZE and wx + dwx >= 0 and wy + dwy >= 0
				check_encounter(mx + dmx, my + dmy, wx + dwx, wy + dwy, encounter)
			end
		end
	end
end

# 初期状態から動作開始
# 男性の座標：A：(0、0)
# 女性の座標：B：（SIZE, SIZE)
# 「運命の出会い」：0（出会っていない）
check_encounter(0, 0, SIZE, SIZE, 0)

print "「運命の出会い」は#{$encounter_num}通り"
