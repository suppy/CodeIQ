# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：逆さになる砂時計
# https://codeiq.jp/ace/thisweek_masuipeo/q1110


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

# 砂時計を1分進める
def one_minute_progress(hourglasses)
  (1..@n).each do |i|
    hourglasses[i] -= 1
    hourglasses[i] = 0 if hourglasses[i] < 0
  end
end

# 砂時計を開始位置posから開始位置の砂時計の分数の個数だけ裏返す
def turn_over(hourglasses, pos)
  (pos...pos+@hourglasses[pos]).each do |i|
    i -= @n if i > @n
    hourglasses[i] = @hourglasses[i] - hourglasses[i]
  end
end

# すべての砂時計について上側の砂が残り1分のとき、
# すべての砂時計について下側に砂が同時に落ちる
#  true :同時に落ちる
#  false:同時に落ちない
def all_sand_fall_same_time?(hourglasses)
  (1..@n).each do |i|
    return false if hourglasses[i] != 1
  end
  return true
end

# 1分後、砂時計を裏返す
# すべての砂時計について下側に砂が同時に落ちるときは@countをインクリメントしてreturn
# 砂時計の状態と開始位置の組がこれまでに現れているときはreturn
# そうでないときは、次の砂時計の操作のため、この関数を呼ぶ
def next_time(current_hourglasses, pos)
  one_minute_progress(current_hourglasses)
  turn_over(current_hourglasses, pos)
  if all_sand_fall_same_time?(current_hourglasses)
    #puts "all the sand falls down to the bottom"
    @count += 1
    return
  end
  # 開始位置を時計回りに一つ移動する
  pos = pos % @n + 1
  # 砂時計の状態と開始位置の組がこれまでに現れていれば、
  # いつまで経ってもすべての砂が同時に下に落ちることはない
  # 関数を抜ける
  if @current_hourglasses_set[[current_hourglasses, pos]] != nil
    #puts "impossible"
    return
  else
    # 砂時計の状態と開始位置の組をハッシュに記憶する
    @current_hourglasses_set[[current_hourglasses, pos]] = 1
  end
  # 次の砂時計の操作する
  next_time(current_hourglasses, pos)
end

# 砂時計の個数
@n = 8
# すべての砂時計の並びを生成する
hourglasses_set = (1..@n).to_a.permutation(@n).to_a
# 開始位置と砂時計の配列の添字を等しくして、処理をわかりやすくするために、
# 砂時計の配列の先頭に0を追加する
hourglasses_set.each do |hourglasses|
  hourglasses.unshift(0)
end
@count = 0
# すべての砂時計の並びについて処理を行う
(0...(1..@n).to_a.inject(:*)).each do |i|
  @hourglasses = hourglasses_set[i]
  current_hourglasses = @hourglasses.clone
  # 開始位置
  pos = 1
  # 砂時計の状態と開始位置の組をハッシュに記憶する
  @current_hourglasses_set = {[current_hourglasses, pos] => 1}
  # 砂時計スタート
  next_time(current_hourglasses, pos)
end
p @count


# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
