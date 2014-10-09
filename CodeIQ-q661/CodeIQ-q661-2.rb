# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：最長の移動経路を考えて！
# https://codeiq.jp/ace/thisweek_masuipeo/q661


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

@n = 2

@height = 5
@width  = 6

@max_length = 0



# 辺posを@n回通っていればfalse
def is_n_times(pos, field)
  num = 0
  if pos % (2*@width+1) >= @width && pos % (2*@width+1) <= 2*@width
    (0...@height).each do |y|
      num += field[pos % (2*@width+1) + (2*@width+1)*y]
    end
  else
    (0...@width).each do |x|
      num += field[(pos / (2*@width+1)).floor * (2*@width+1) + x]
    end
  end
  return false if num >= @n
  return true
end

# 現在の辺posを方向dirへ移動してきたときに、次に移動できる辺とその方向を求め、
# この関数を再帰的に呼ぶ
# B地点に到達した場合に通った辺の数を調べ、最大であれば、最大値を更新
# 同一直線上を3回以上通る場合は除外する
def move(pos, dir, path, field)

  # B地点に到達した場合
  if pos == field.length - 1 or pos == field.length - @width - 1
    if @max_length < path.length
      @max_length = path.length
      @max_path = path
      #p @max_path
      #print "path_length:#{@max_path.length}\n"
    end
    return
  end
  
  # 移動を表す配列
  move_dir = [0, 0, 1, 1]
  up_move = [-@width, -2 * @width - 1, -@width - 1, 0]
  down_move = [@width+1, 0, @width, 2 * @width+1]
  right_move = [1, -@width, 0, @width + 1]
  left_move = [0, -@width-1, -1, @width]
  horizontal = [right_move, left_move]
  vertical = [up_move, down_move]

  # 縦方向に移動している場合
  if pos % (2*@width+1) >= @width && pos % (2*@width+1) <= 2*@width
    (0..3).each do |j|
      i = vertical[dir][j]
      # 移動できない場合はnext
      next if pos % (2*@width+1) == 2*@width && dir == 0 && pos - @width == pos + i
      next if pos % (2*@width+1) == @width && dir == 0 && pos - @width -1 == pos + i
      next if pos % (2*@width+1) == 2*@width && dir == 1 && pos + @width +1 == pos + i
      next if pos % (2*@width+1) == @width && dir == 1 && pos + @width == pos + i
      # 移動先の辺
      next_pos = pos + i
      next if next_pos < 0 || next_pos >= field.length 
      # 同一直線上を3回以上通る場合はnext
      next if !is_n_times(next_pos, field)
      # 次の方向を設定
      next_dir = move_dir[j]
      next_field = field.clone
      # 辺を通った回数を加算
      next_field[next_pos] += 1
      # 通った辺を格納
      next_path = path.clone.push(next_pos)
      # 移動処理
      move(next_pos, next_dir, next_path, next_field)
    end
  # 横方向に移動している場合
  else
    (0..3).each do |j|
      i = horizontal[dir][j]
      # 移動できない場合はnext
      next if pos % (2*@width+1) == @width-1 && dir == 0 && pos + 1 == pos + i
      next if pos % (2*@width+1) == 0 && dir == 1 && pos - 1 == pos + i
      # 移動先の辺
      next_pos = pos + i 
      next if next_pos < 0 || next_pos >= field.length 
      # 同一直線上を3回以上通る場合はnext
      next if !is_n_times(next_pos, field)
      # 次の方向を設定
      next_dir = move_dir[j]
      next_field = field.clone
      # 辺を通った回数を加算
      next_field[next_pos] += 1
      # 通った辺を格納
      next_path = path.clone.push(next_pos)
      # 移動処理
      move(next_pos, next_dir, next_path, next_field)
    end
  end
end

# 最初に右方向に移動する場合
# 各辺を通った回数を初期化
field = Array.new(@width * (@height+1) + @height * (@width+1), 0)
# 通った辺を格納する配列を設定
path = [0]
# 方向を設定（右方向）
dir = 0
# 各辺を通った回数を設定
field[0] = 1
# 移動開始
move(path[0], dir, path, field)

# 最初に下方向に移動する場合
# 各辺を通った回数を初期化
field = Array.new(@width * (@height+1) + @height * (@width+1), 0)
# 通った辺を格納する配列を設定
path = [@width]
# 方向を設定（下方向）
dir = 1
# 各辺を通った回数を設定
field[@width] = 1
# 移動開始
move(path[0], dir, path, field)

#p @max_path
p @max_length



# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
