# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：公平に分けられたケーキ
# https://codeiq.jp/ace/thisweek_masuipeo/q1247


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

# width×heightのサイズのケーキを切る
# 引数
#  width:   ケーキの横の長さ
#  height:  ケーキの縦の長さ
#  x:       縦に切る場合の位置。ただし、x=0の時には横に切る
#  y:       横に切る場合の位置。ただし、y=0の時には縦に切る
#
# 戻り値
#  width:   残ったケーキの横の長さ
#  height:  残ったケーキの縦の長さ
#  eat_num: 食べるケーキの量
#  cut_length:切った部分の長さ
def cut_cake(width, height, x, y)
  # 横に切る
  if x == 0
    if width * height > width * y * 2
      eat_num = width * y
      height = height - y
    else
      eat_num = width * (height - y)
      height = y
    end
    cut_length = width
  # 縦に切る
  elsif y == 0
    if width * height > x * height * 2
      eat_num = x * height
      width = width - x
    else
      eat_num = (width - x) * height
      width = x
    end
    cut_length = height
  end
  #print "#{width}, #{height}, #{eat_num}, #{cut_length}\n"
  return width, height, eat_num, cut_length
end

p cut_cake(4, 4, 0, 1)
p cut_cake(4, 2, 0, 1)
p cut_cake(4, 4, 1, 0)
p cut_cake(4, 4, 3, 0)

# 交互にケーキを切る
# すべての切り方を再帰的に呼び出し、二人が食べる量が同じになったとき、
# 切った部分の長さの最小値を求める
#  width: ケーキの横の長さ
#  height:ケーキの縦の長さ
#  person: 0:青色の人　1:赤色の人
#  num[]:  それぞれがこれまでに食べたケーキの量
#  length: これまでに切った部分の長さ
def repeat_cut_cake(width, height, person, num, length)
  #print "#{width}, #{height}, #{person}, #{num}, #{length}\n"
  # 切り終わった
  if width == 1 && height == 1
    #if num[person] + 1 == @width * @height / 2
    if @min_cut_length == -1 || @min_cut_length > length
      #print "#{num} #{length}\n"
      p length
      @min_cut_length = length
    end
    #end
    return
  end
  # ケーキを縦に切る場合
  (1..width/2).each do |x|
    next_width, next_height, eat_num, cut_length = cut_cake(width, height, x, 0)
    next_num = num.clone
    next_num[person] += eat_num
    next if next_num[person] > @width * @height / 2
    #person = -(person - 1)
    # 残ったケーキを切るために再帰呼び出しする
    repeat_cut_cake(next_width, next_height, -(person - 1), next_num, length + cut_length)
  end
  # ケーキを横に切る場合
  (1..height/2).each do |y|
    next_width, next_height, eat_num, cut_length = cut_cake(width, height, 0, y)
    next_num = num.clone
    next_num[person] += eat_num
    next if next_num[person] > @width * @height / 2
    #person = -(person - 1)
    # 残ったケーキを切るために再帰呼び出しする
    repeat_cut_cake(next_width, next_height, -(person - 1), next_num, length + cut_length)
  end
  
end

@width = 16
@height = 12
@min_cut_length = -1
#repeat_cut_cake(4, 4)
repeat_cut_cake(@width, @height, 0, [0, 0], 0)
#repeat_cut_cake(16, 12, 0, [0, 0], 0)

# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
