# @riverplus   Kawazoeさんからの問題
# コード・トライアスロン
# https://codeiq.jp/q/1383


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"


require 'prime'

# Q1
@memo = {}
def F(n)
  case n
  when 0
    @memo[n] = 3
  when 1
    @memo[n] = 0
  when 2
    @memo[n] = 2
  else
    @memo[n - 3] = F(n - 3) if !@memo.has_key?(n - 3)
    @memo[n] = F(n - 2) + @memo[n - 3]
  end
  @memo[n]
end

count = 0
n = 0
while(count < 30) do
  n += 1
  count += 1 if n.prime? && F(n) % n == 0
end
P = F(n)

# Q2
def G(n)
  n.prime_division[-1][0]
end

Q = G(P)

# Q3
def H(n)
  sum = 0
  Prime.each_with_index do |p, i|
    break if p > n
    sum += p if (i + 1).prime?
  end
  sum
end

R = H(Q)

print "P = #{P}\n"
print "Q = #{Q}\n"
print "R = #{R}\n"

# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
