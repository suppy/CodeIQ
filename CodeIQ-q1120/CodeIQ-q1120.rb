# @cielavenir  cielさんからの数学の問題
# モーニングクエスト：区分求積
# https://codeiq.jp/ace/cielavenir/q1120


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

require 'bigdecimal'



def f(x)
  #return 1
  return x**x
end

# 台形公式(Trapezoid rule)
def trapezoid(a, b)
  return (b - a) / 2 * (f(a) + f(b))
end

# シンプソンの公式(Simpson's rule)
def simpson(a, b)
  return (b - a) / 6 * (f(a) + 4 * f(a + (b - a) / 2) + f(b))
end

# シンプソンの3/8公式(Simpson's 3/8 rule)
def simpson38(a, b)
  return (b - a) / 8 * (f(a) + 3 * f(a + (b - a) / 3) + 3 * f(a + (b - a) / 3 * 2) + f(b)) 
end

# ブールの公式(Boole's rule)
def boole(a, b)
  return (b - a) / 90 * (7 * f(a) + 32 * f(a + (b - a) / 4) + 12 * f(a + (b - a) / 4 * 2) + 32 * f(a + (b - a) / 4 * 3) + 7 * f(b))
end

#n = 100000000

n = 1000000
a = 1.0
b = 6.0

answer = 17128.111274826415512

#answer = 5.0
n = 1
loop do
  h = (b - a) / n
  #puts h
  s = 0.0
  x = a
  while x < b
    s += trapezoid(x, x + h)
  #  s += simpson(x, x + h)
  #  s += simpson38(x, x + h)
  #  s += boole(x, x + h)
    x += h
    #p x
  end
  #print "#{n} #{answer - s}\n"
  break if (answer - s).abs < 0.1
  n += 1
end
p n


# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
