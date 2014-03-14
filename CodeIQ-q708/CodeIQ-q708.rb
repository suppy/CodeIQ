# カラフルな八面体を転がそう。

# 入力文字列の通りに転がしたとき、上面に来る色の文字列を返す
def rotate_octahedron(input)
	output = "Y" # 出力文字列に、最初の上面の色（黄）を設定する
	
	# 回転方向と、その方向に転がしたときに上面に来る色を対応させたハッシュ
	# 12時の方向は 0 に対応させている
	# 転がせない場合は、""
	rotate = {   0 => "",
				 2 => "G",
				 4 => "",
				 6 => "R",
				 8 => "",
				10 => "B"
			}

	top_color = "Y" # 上面の色を設定
	# 入力文字列の通りに転がす
	for i in (0...input.length)
		# 回転方向を取り出す
		if input[i] == "D" # 12時の方向
			index = 0
		elsif input[i] == "T" # 10時の方向
			index = 10
		else
			index = input[i].to_i
		end
#		print index.to_s + "時方向に回転\n"

		# 回転したときの上面の色を取り出し、出力文字列に追加する
		new_top_color = rotate[index]
		output += new_top_color
		# ハッシュを上面だった色に書き換える
		rotate[index] = top_color

		# 回転したあとのハッシュを求める
		rotate_old = rotate.clone
		0.step(10, 2) do |j|
			if rotate_old[j] != ""
				# 回転すると、ハッシュの内容は以下のように置き換わる
				rotate[(j + 6) % 12] = rotate_old[j]
				rotate[j] = ""
			end
		end
#		p rotate	

		# 上面の色を更新する
		top_color = new_top_color
	end
#	p output

	return output # 出力文字列を返す
end


# 動作チェック
def test
	# 入力文字列のテストケースを取り込む
	test_input = []
	open("test_input.txt") do |file|
		while l = file.gets
			test_input << l.chop
		end
	end
#	p test_input

	# 出力文字列のテストケースを取り込む
	test_expected = []
	open("test_expected.txt") do |file|
		while l = file.gets
			test_expected << l.chop
		end
	end
#	p test_expected

	# すべてのテストケースの組が正しく計算できているか確認する
	right = 0
	wrong = 0
	for k in (0...test_input.length)
		input = test_input[k]
		output = rotate_octahedron(input)
		if output == test_expected[k]
#			p "right!"
			right += 1
		else
			wrong += 1
		end
	end
	print "正解：" + right.to_s + "\n"
	print "誤り：" + wrong.to_s + "\n"
end

# 動作チェック
# test

# 本番
input = ""
open("real_input.txt") do |file|
	while l = file.gets
		input = l.chop
	end
end
print "入力文字列:" + input + "\n"
print "出力文字列:" + rotate_octahedron(input) +"\n"
