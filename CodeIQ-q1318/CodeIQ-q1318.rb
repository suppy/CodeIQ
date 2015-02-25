# @Nabetani  鍋谷 武典さんからの数学の問題
# 中学入試から：対称軸の本数を数えよう
# https://codeiq.jp/ace/nabetani_takenori/q1318


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

# 円周上を n 等分する点を考え、順に 点0, 点1, 点2, ... , 点(n - 1) とする

# 点 axis を通る対称軸で、点 pos と対称となる点を求める
# なお、axis の少数第一位が 5 である場合は、
# axis を少数第一位で切り捨てた値と、少数第一位で切り上げた値の間の点を通る対称軸とする
def symmetry_pos(n, pos, axis)
  return (n - (n + pos - axis).floor % n + axis).floor % n
end

# 点 axis を通る対称軸で、線分 line と対称となる線分を求める
def symmetry_line(n, line, axis)
  return [symmetry_pos(n, line[0], axis), symmetry_pos(n, line[1], axis)].sort
end

# 点 axis を通る対称軸で、図形 lines と対称となる図形を求める
def symmetry(n, lines, axis)
  return lines.collect {|line| symmetry_line(n, line, axis)}
end

# 点A, 点B, 点C, ...という形式を
# 点0, 点1, 点2, ...といういう形式に変換する
def convert(lines)
  line_set = []
  lines.each do |line|
    line_set << [line[0].ord - 'A'.ord, line[1].ord - 'A'.ord].sort
  end
  return line_set
end

# 対称軸の数を数える
def count_axis(n, lines)
  count = 0
  # 隣り合う点の間を通る対称軸は、0.5, 1.5, 2.5, ...として表す
  0.step((n-1)/2.0, 0.5) do |i|
    if symmetry(n, lines, i).sort == lines.sort
      count += 1 
    end
  end
  return count
end
    
File.open("data.txt", "r") do |f|
  wrong_id = []
  while problem = f.gets
    id, a, i, answer = problem.strip.split(" ")
    n = a.to_i
    lines = i.split(",").collect {|line| line.split('')}
    answer = answer.to_i

    # 点A, 点B, 点C, ...という形式を
    # 点0, 点1, 点2, ...といういう形式に変換
    lines = convert(lines)

    # 対称軸の数を数える
    count = count_axis(n, lines)
    
    if count != answer
      wrong_id << id
    end
  end
  puts wrong_id.join(",")
end


# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
