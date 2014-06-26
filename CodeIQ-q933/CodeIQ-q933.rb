# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：カレンダーの最大長方形
# https://codeiq.jp/ace/thisweek_masuipeo/q933


# 祝日をファイルから読み込んで、日付の文字列をハッシュのキーに設定
h = {}
File.open("holiday.txt") do |f|
	while line = f.gets do
		h[line.chop] = 1
	end
end
#p h

# 面積の和
sum_area = 0

start_date = "2006/01/01"
end_date   = "2015/12/31"

start_year = start_date.split('/')[0].to_i
end_year = end_date.split('/')[0].to_i

(start_year..end_year).each do |year|
	(1..12).each do |month|
		# 月初
		first_day = 1
		# 月末
		if month != 12 # ruby では、存在しない日付を設定するとエラーとなるので、12月は別に処理している
			last_day = (Time.local(year, month + 1, 1, 0, 0, 0) - 60 * 60 * 24).day
		else
			last_day = 31
		end

		# 面積の最大値
		max_area = 0

		# 月の各日付について処理を行う
		(first_day..last_day).each do |day|

			# 指定された日付を左上とした長方形を探す
			# 横方向で最大となる長さは 5（月~金）
			# 縦方向で最大となる長さは 4（1日が月曜日となる場合など）
			imax = 5 # 横方向の最大値
			jmax = 4 # 縦方向の最大値
			
			# 指定された日付を左上とした長方形には、
			# 幅が最大となる横長の長方形と
			# 高さが最大となる縦長の長方形が存在する

			# 横長の長方形の幅と高さを初期化
			width_yoko  = 0
			height_yoko = 0
			# 縦長の長方形の幅と高さを初期化
			width_tate  = 0
			height_tate = 0
			
			is_next_month = false
			include_holiday = false

			# 指定された日付を左上とした長方形内の各日付について処理を行う
			(0..jmax).each do |j|
				(0..imax).each do |i|
			
					# 指定された日付を元に、各日付を求める
					t = Time.local(year, month, day, 0, 0, 0) + 60 * 60 * 24 * (i + j * 7)
					
					# 土曜 or 日曜
					if t.saturday? || t.sunday?
						# 横長の長方形の幅と高さを設定
						width_yoko  = i     # 横方向の値 i が幅となる
						height_yoko = j + 1 # 縦方向の値を設定する
						break # 横方向のループを抜ける
					end

					# 翌月の日付
					if t.month != month
						# 縦長の長方形の幅と高さを設定
						# 指定された日付を左上とした長方形内に祝日が含まれる場合
						if include_holiday
							width_tate = imax + 1 # 横方向の最大値に 1 を加算した値が幅になる
							height_tate = j # 前週までが縦長の長方形の高さになる
						else
							# 日付が長方形の左端の場合
							# この場合は横長の長方形と縦長の長方形は同じになる
							if i == 0
								width_tate = width_yoko
								height_tate = j # 前週までが縦長の長方形の高さになる
							else
								width_tate = i      # 横方向の値 i が幅となる
								height_tate = j + 1 # 縦方向の値を設定する
							end
						end

						# 翌月を表すフラグを true に設定し、ループを抜ける
						is_next_month = true	
						break
					end

					# 祝日
					# ハッシュ h に日付の文字列が設定されていれば、祝日
					if h[t.strftime("%Y/%m/%d")] == 1
						include_holiday = true
						# 横長の長方形の幅と高さを設定
						# 横長の長方形の幅が初期値のままの場合は、指定した日付と同じ週の場合
						if width_yoko == 0
							width_yoko  = i # 横方向の値 i が幅となる
							height_yoko = 1
						else
							height_yoko = j # 前週までが横長の長方形の高さになる
						end

						# 縦長の長方形を探すため、横方向の最大値を i-1 に設定
						imax = i - 1
						break
					end
				end
				break if is_next_month # 翌月であれば、それ以降の日付の処理は必要ないので、ループを抜ける

			end

			# 横長と縦長の長方形で、面積が大きい方を、幅と高さに設定
			if width_yoko * height_yoko > width_tate * height_tate
				width, height = width_yoko, height_yoko
			else
				width, height = width_tate, height_tate
			end
			
			# 面積の最大値を更新
			if width * height >= max_area
				max_area = width * height
			end
		end
		# print "#{year}/#{month} #{max_area}\n"
		sum_area += max_area
	end
end
p sum_area
