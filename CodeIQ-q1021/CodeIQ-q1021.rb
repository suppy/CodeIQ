# Short Coder @ozy4dm  おずず@Ozyさんからの言語指定の問題
# プログラミング言語★総選挙　本選挙
# https://codeiq.jp/ace/ozy_ozuzu/q1021


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

# 出欠情報を格納する配列（一次元）
@arr = []
@w = 0
@h = 0
File.open("sample/6.out.txt", "r") do |f|
while (s=f.gets) do
   puts s.strip
end
end
File.open("sample/6.in.txt", "r") do |f|
#while (s=gets) != nil do
while (s=f.gets) do
   puts s.strip
  s_arr = s.strip.split('')
  @w = s_arr.length
  @h += 1
  s_arr.each do |str|
  	if str == "O"
  	  # 出席は、0を格納
  	  @arr << 0
    else
  	  # 欠席は、2を格納
      @arr << 2
    end
  end
end
end
# p @arr
# print "H x W = #{@h} x #{@w}\n"

# 出席者が隣り合っているエリアを探索する
#  x, y:現在位置
#  area:これまでに探索した出席者が隣り合っているエリアを表す配列
#   area の値
#     0:探索済み
#     2:探索していない
def search(x, y, area)
#p area
#if @arr[x + y * @w] != 2
#if true
#  print "(#{x}, #{y})\n"
  # 隣り合う場所（右上左下）について処理を行う
  [[1, 0], [0, -1], [-1, 0], [0, 1]].each do |dir|
    dx = dir[0]
    dy = dir[1]
    x_next = x + dx
    y_next = y + dy
    # 隣り合う場所が範囲内で、出席者のとき
    if x_next >= 0 && x_next < @w && y_next >= 0 && y_next < @h &&
          @arr[x_next + y_next * @w] == 0
#      print " -> (#{x_next}, #{y_next})\n"
      # 隣り合う場所が探索済みのとき
      next if area[x_next + y_next * @w] == 0
#        print " -> (#{x_next}, #{y_next})\n"
      #area_next = area.clone << [x_next, y_next]
      # 隣り合う場所を探索対象から外すために欠席者扱いにする
      @arr[x_next + y_next * @w] = 2
      # 隣り合う場所を出席者が隣り合っているエリアに設定する
      area[x_next + y_next * @w] = 0
      # 出席者が隣り合っているエリアを探索する
      search(x_next, y_next, area)
#        search(x_next, y_next, area_next)
    end
  end
#else
#  return
#end
end

def display(area)
  (0...@h).each do |y|
    (0...@w).each do |x|
      print area[x + y * @w]
    end
    print "\n"
  end
end

# チェック模様になるように設定
def change_check_pattern(area)
  (0...@w).each do |x|
    (0...@h).each do |y|
      if area[x + y * @w] != 2
        area[x + y * @w] = (x + y) % 2
      end
    end
  end
# p area
end

# チェック模様のそれぞれの色のマスが同じ数であれば
# ペアを作ることができる
def judge_pattern(area)
  if area.count(0) == area.count(1)
#    puts "yes"
    return true
  else
#    puts "no"
    return false
  end
end

#x = 9
#y = 9

#
# 出席者が隣り合っているエリアすべてについて、ペアをつくることができるかを判定する
#
def judge_all_pattern
  is_pair = true
  # すべての場所(x, y)について処理を行う
  (0...@h).each do |y|
    (0...@w).each do |x|
      # 現在位置が欠席者のとき
      next if @arr[x + y * @w] == 2
      # 現在位置を探索対象から外すために欠席者扱いにする
      @arr[x + y * @w] = 2
      # 出席者が隣り合っているエリアを表す配列をすべて欠席者に設定
      area = []
      (0...@w * @h).each do |pos|
        area[pos] = 2
      end
      # 現在位置を出席者が隣り合っているエリアに設定する
      area[x + y * @w] = 0
      # 出席者が隣り合っているエリアを探索する
      search(x, y, area)
      # チェック模様になるように設定
      change_check_pattern(area)
      #p area
      display(area)
      # ペアをつくることができるかを判定する
      if !judge_pattern(area)
        is_pair = false
        break
      end
      print "\n"
    end
    break if !is_pair
  end
  return is_pair
end

# 出席者がいないとき
if @arr.count(0) == 0
  is_pair = false
else
  is_pair = judge_all_pattern
end
if is_pair
  puts "yes"
else
  puts "no"
end






# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
