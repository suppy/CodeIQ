# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：クロスワードを作成して！
# https://codeiq.jp/ace/thisweek_masuipeo/q1094


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"


@width = 6
@height = 5

# 上記のサイズの場合、黒マスは最大10個


# クロスワードパズルを表示する
def display(crossword)
  (0...@height).each do |y|
    (0...@width).each do |x|
      if crossword.include?(x + y * @width)
        print "■"
      else
        print "　"
      end
    end
    print "\n"
  end
end


# 黒マスが縦横に連続していないかを判定する
def check_black_sequence(crossword)
  (0...@height).each do |y|
    (0...@width).each do |x|
      # 白マスのとき
      next if !crossword.include?(x + y * @width)
      # 隣り合う右上左下方向のマスを調べる
      [[1, 0], [0, -1], [-1, 0], [0, 1]].each do |dir|
        dx = dir[0]
        dy = dir[1]
        x_next = x + dx
        y_next = y + dy
        # 範囲外のとき
        next if x_next < 0 || x_next >= @width || y_next < 0 || y_next >= @height
        # 隣り合うマスも黒マスのとき
        # 黒マスが縦横に連続している
        return false if crossword.include?(x_next + y_next * @width)
      end
    end
  end
  # 黒マスが縦横に連続していない
  return true
end


# つながっている白マスを探索し、白マスの番号を配列に格納する
def search_white_sequence(crossword, white_sequence, x, y)
  # 隣り合う右上左下方向のマスを調べる
  [[1, 0], [0, -1], [-1, 0], [0, 1]].each do |dir|
    dx = dir[0]
    dy = dir[1]
    x_next = x + dx
    y_next = y + dy
    # 範囲外のとき
    next if x_next < 0 || x_next >= @width || y_next < 0 || y_next >= @height
    # すでに探索したマスのとき
    next if white_sequence.include?(x_next + y_next * @width)
    # 黒マスのとき
    next if crossword.include?(x_next + y_next * @width)
    # 白マスの番号を配列に格納する
    white_sequence << x_next + y_next * @width
    # 位置を更新してつながっている白マスを探索する
    search_white_sequence(crossword, white_sequence, x_next, y_next)
  end
end


# つながっている白マスの個数を数える
def count_white_sequence(crossword)
  white_sequence = []
  (0...@height).each do |y|
    (0...@width).each do |x|
      # 黒マスのとき
      next if crossword.include?(x + y * @width)
      # つながっている白マスを探索する
      search_white_sequence(crossword, white_sequence, x, y)
      # つながっている白マスの個数を返す
      return white_sequence.length
    end
  end
  return 0
end


# 黒マスによって盤面が分断されていないかを判定する
def check_segment(crossword)
  # 黒マスの数と、つながっている白マスの数の和が、クロスワードパズルのマスの数になっていれば、
  # 黒マスによって盤面が分断されていない
  if crossword.length + count_white_sequence(crossword) == @width * @height
    return true
  else
    return false
  end
end



# 横に6マス、縦に5マスのクロスワードパズルでは、黒マスは最大10個（紙と鉛筆で検証）
# （ (@width/2).ceil + (@height/2).ceil + 1 で求まるのかも）

# 条件を満たすクロスワードパズルの数
count = 0
#count_crosswords = 0
# 黒マスの数を変えて処理を行う
(0..10).each do |i|
  # 黒マスが i 個のクロスワードパズルの集合を作成する
  # クロスワードパズルのデータは、黒マスにするマスの番号を格納した配列とする
  crosswords = (0...@width*@height).to_a.combination(i).to_a
  crosswords.each do |crossword|
    # 黒マスが縦横に連続していない
    # 黒マスによって盤面が分断されていない
    # 上記の2つの条件を満たすときにカウントする
    count += 1 if check_black_sequence(crossword) && check_segment(crossword)
  end 
  #count_crosswords += crosswords.length
  #print "#{count} / #{count_crosswords}\n"
end
p count


=begin
count = 0
(0..10).each do |i|
  count += (0...@width*@height).to_a.combination(i).to_a.length
  p count
end
p count
=end

=begin
i = 10
crosswords = (0...@width*@height).to_a.combination(i).to_a
n = 20100
white_sequence = []
crossword = crosswords[n]
display(crossword)
#p count_white_sequence(crossword)
p check_segment(crossword)
#display(white_sequence)

exit
=end

# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
