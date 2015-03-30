# @riverplus  Kawazoeさんからの数学の問題
# 「ブラック・ブロック」問題
# https://codeiq.jp/ace/kawazoe/q1339


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

n = 6
m = 4

# メモ化
@memo = {}

# n個並べて、m個以上の連続を持たない並べ方の数
def f(n, m)
  return 2 ** n if n < m
  count = 0
  (1..m).each do |i|
    if !@memo.has_key?([n - i, m])
      @memo[[n - i, m]] = f(n - i, m)
    end
    count += @memo[[n - i, m]]
  end
  return count
end

# n個並べて、もっとも長い黒石の連続した個数がm個となるような並べ方の数
def g(n, m)
  return f(n, m + 1) - f(n, m)
end

puts g(30, 5)

p g(n, m) 
p f(1, 3)
p f(2, 3)
p f(3, 3)
p f(4, 3)
p f(5, 3)
p f(6, 3)
p f(6, 5)
p f(6, 4)
p g(6, 4)
p g(12, 3)
p g(30, 5)


# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
