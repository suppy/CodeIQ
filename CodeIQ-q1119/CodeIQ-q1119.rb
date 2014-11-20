# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：ショートケーキの日
# https://codeiq.jp/ace/thisweek_masuipeo/q1119


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

n = 4

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
