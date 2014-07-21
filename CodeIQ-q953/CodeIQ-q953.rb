# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：W杯出場国しりとり
# https://codeiq.jp/ace/thisweek_masuipeo/q953

# 出場している32ヶ国
@countries = [
	"Brazil",
	"Croatia",
	"Mexico",
	"Cameroon",
	"Spain",
	"Netherlands",
	"Chile",
	"Australia",
	"Colombia",
	"Greece",
	"Cote d'Ivoire",
	"Japan",
	"Uruguay",
	"Costa Rica",
	"England",
	"Italy",
	"Switzerland",
	"Ecuador",
	"France",
	"Honduras",
	"Argentina",
	"Bosnia and Herzegovina",
	"Iran",
	"Nigeria",
	"Germany",
	"Portugal",
	"Ghana",
	"USA",
	"Belgium",
	"Algeria",
	"Russia",
	"Korea Republic",
]

# 求める国の数
@num = 0


#
# しりとりを行う再帰関数
#  shiritori_list:これまでにしりとりで使われた国のリスト（しりとり順）
#
def shiritori(shiritori_list)
	# これまでのしりとりで使われなかった国について処理を行う
	(@countries - shiritori_list).each do |country|
		# しりとりできる場合
		if shiritori_list[-1][-1].upcase == country[0]
			# しりとりのリストに国を追加
			shiritori_list_next = shiritori_list.clone
			shiritori_list_next << country
			# 使われた国の数の更新
			if @num < shiritori_list_next.length
				@num = shiritori_list_next.length
				@shiritori_list_max = shiritori_list_next	
			end
			# 次のしりとりを行うため、再帰関数を呼ぶ
			shiritori(shiritori_list_next)
		end
	end
end

# すべての国について処理を行う
@countries.each do |country|
	# しりとりの最初の国に設定
	shiritori_list = [country]
	# しりとりを行う関数を呼ぶ
	shiritori(shiritori_list)
end

# p @shiritori_list_max
p @num
