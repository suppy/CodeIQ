# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：同じ長さで正方形
# https://codeiq.jp/ace/thisweek_masuipeo/q1059

# 縦、横の組を格納する配列
set = []
(1..500).each do |l|
  # 正方形にならないとき
  next if l % 4 != 0
  # 辺の長さが整数にならないとき
  next if l % 2 != 0
  square = (l / 4) ** 2
  (1..(l/4)).each do |height1|
    width1 = l / 2 - height1
    rectangle1 = height1 * width1
    (1..(l/4)).each do |height2|
      width2 = l / 2 - height2
      rectangle2 = height2 * width2
      if square == rectangle1 + rectangle2
        # 縦と横の組は、縦<横になるように格納する
        set << [rectangle1, rectangle2].sort
      end
    end
  end
end
# 縦と横の組の重複をなくし、ソートする
set = set.uniq.sort

# 同じ比で整数倍のものは除く
set.each do |rectangles|
  (2..set[-1][0]/rectangles[0]).each do |i|
    set.delete([rectangles[0] * i, rectangles[1] * i])
  end
end
p set.length

