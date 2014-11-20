# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：ショートケーキの日
# https://codeiq.jp/ace/thisweek_masuipeo/q1119


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"


(2..100).each do |n|
  strawberry_num = (1..n).to_a
  cakes = [[1]]
  (n-1).times do
    next_cakes = []
    cakes.each do |cake|
      rest_strawberry_num = strawberry_num - cake
      rest_strawberry_num.each do |num|
        next if Math.sqrt(cake[-1] + num) - Math.sqrt(cake[-1] + num).floor > 0
        next_cakes << (cake.clone << num)
      end
    end
    cakes = next_cakes
    # n個の切り分けができた場合、n番目と1番目のケーキのイチゴの和が平方数になっているか調べる
    if cakes.length != 0 && cakes[0].length == n
      cakes.each do |cake|
        next if Math.sqrt(cake[-1] + cake[0]) - Math.sqrt(cake[-1] + cake[0]).floor > 0
        p n
        #p cake
        #p cake.sort
        exit
      end
    end
    break if cakes.length == 0
  end
end

exit


(1..1000).each do |n|
cakes = (1..n).to_a.permutation(n).to_a
#p cakes

cakes.each do |cake|
  square = true
  (0...(n-1)).each do |i|
    if Math.sqrt(cake[i] + cake[i+1]) - Math.sqrt(cake[i] + cake[i+1]).floor > 0
      square = false
      break
    end
  end
  if square
    square = false if Math.sqrt(cake[-1] + cake[0]) - Math.sqrt(cake[-1] + cake[0]).floor > 0
  end
  if square
    p n
    p cake
    #break
    exit
  end
end
end


# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
