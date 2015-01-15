# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：公平に分けられたケーキ
# https://codeiq.jp/ace/thisweek_masuipeo/q1247


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

# 1×1のサイズから始めて、切る前のケーキのサイズのパターンを求めていき、
# 16×12のサイズになった時に、切った部分の長さが最小になるものを求める


@width = 16
@height = 12

# ケーキの状態を配列で表す
# [横の長さ, 縦の長さ, 相手のケーキの量, 自分のケーキの量, 切った部分の長さ]
# 初期値
cakes = [[1, 1, 0, 1, 0]]

min_length = -1
loop do
  next_cakes = []
  cakes.each do |cake|
    width = cake[0]
    height = cake[1]
    num1 = cake[2]
    num2 = cake[3]
    length = cake[4]
    next if num1 > @width * @height / 2
    next if length > min_length && min_length > 0
    if width == @width && height == @height && num1 == @width * @height / 2
      if min_length == -1 || min_length > length
        min_length = length
        p min_length
      end
      next
    end
    next if width > @width || height > @height
    # 横に切った場合
    (1..width).each do |x|
      next if width + x > @width
      # ケーキの状態を更新
      # なお、切るのを交代するので、ケーキの量は入れ替えて配列に設定する
      next_cakes << [width + x, height, num2, num1 + x * height, length + height]
    end
    # 縦に切った場合
    (1..height).each do |y|
      next if height + y > @height
      # ケーキの状態を更新
      # なお、切るのを交代するので、ケーキの量は入れ替えて配列に設定する
      next_cakes << [width, height + y, num2, num1 + width * y, length + width]
    end

  end
  break if next_cakes.length == 0
  cakes = next_cakes
end

p min_length

# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
