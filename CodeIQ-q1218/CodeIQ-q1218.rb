# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：男女平等な席替え？
# https://codeiq.jp/ace/thisweek_masuipeo/q1218


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

@width = 6
@height = 5

# 前後左右の席を調べる
#  true :異性がいる
#  false:異性がいない
def check_neighbor(seats, x, y)
  [[1, 0], [0, -1], [-1, 0], [0, 1]].each do |dir| # [右,前,左,後]
    if x + dir[0] >= 0 && x + dir[0] < @width && y + dir[1] >= 0 && y + dir[1] < @height
      return true if seats[x + y * @width] != seats[x + dir[0] + (y + dir[1]) * @width]
    end
  end
  return false
end

# 前後左右のいずれかに必ず異性が座る配置になっているか調べる
#  true :必ず異性がいる
#  false:異性がいない席がある
def check(seats)
  (0...@height).each do |y|
    (0...@width).each do |x|
      return false if !check_neighbor(seats, x, y)
    end
  end
  return true
end

# 座席を表示する
def display(seats)
  (0...@height).each do |y|
    (0...@width).each do |x|
      print "#{seats[x + y * @width]}"
    end
    print "\n"
  end
  print "\n"
end          

# 座席は一次元配列で表現する
# 配列の値
#    1:男子
#    0:女子

# 左前の座席が男子(1)の場合の個数を数える
count = 0
# 男子が座る座席を14個選ぶ
(1..(@width * @height - 1)).to_a.combination(@width * @height / 2 - 1).each do |set|
  #p set
  # 男子が座る座席の配列の値をセットする
  seats = [1] + Array.new(@width * @height - 1, 0)
  set.each do |i|
    seats[i] = 1
  end
  #p seats
  # 前後左右のいずれかに必ず異性が座る配置になっているか調べる
  if check(seats)
    #display(seats)
    count += 1
  end
end
# 左前の座席が女子(0)の場合もあるので、2倍する
count *= 2
p count


=begin
# 左前が男子(0)の場合の個数を数える
[0, 1].repeated_permutation(@width * @height - 1).each do |seats|
  next if seats.count(0) != @width * @height / 2 - 1
  if check([0] + seats)
    # display([0] + seats)
    count += 1
  end
end
# 左前が女子(1)の場合もあるので、2倍する
p count * 2
=end


# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
