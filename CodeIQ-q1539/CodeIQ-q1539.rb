# @riverplus   Kawazoeさんからの問題
# 「バイナリ・カウント」問題
# https://codeiq.jp/q/1539


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"



def F(n)
  (1..n).map {|i|
    i.to_s(2).count("1")  
  }.inject(:+)

end

def F2(n)
  return 1 if n == 1
  return n / 2 + 2 * F(n / 2) - 1
end

@memo = {}
def Fn(n)
  return 0 if n == 0
  return 1 if n == 1
  n, m = 2 ** Math.log2(n).floor, n % (2 ** Math.log2(n).floor)
  #print "#{n},#{m}\n"
  #print "#{n.class},#{m.class}\n"

begin  
  if !@memo.has_key?(n)
    @memo[n] = n / 2 + 2 * Fn(n / 2) - 1
  end
  if !@memo.has_key?(m)
    @memo[m] = Fn(m)
  end
  return  @memo[n] + m + @memo[m]
  #return Fn(n) + m + Fn(m)
end
  #return  n / 2 + 2 * Fn(n / 2) - 1 + m + Fn(m)


end

#F(1) = 1
#F(2) = F(1) + 1
#F(3) = 
#puts F(3)
#puts F(15)
#puts F(10**3)
=begin
print "#{F(1)}, #{F2(1)}\n"
print "#{F(2)}, #{F2(2)}\n"
print "#{F(4)}, #{F2(4)}\n"
print "#{F(8)}, #{F2(8)}\n"
#print "#{F(2**20)}, #{F2(2**20)}\n"
#print "#{F2(2**20)}\n"
print "#{F(8)}\n"
print "#{F(16)}\n"
print "#{F(24)}\n"
print "#{F(27)}\n"
=end
#print "#{Fn(27)}\n"

#puts F(10**3)
puts Fn(10**3)

puts Fn(10 ** 10)

# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
