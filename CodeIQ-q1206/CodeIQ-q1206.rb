# @riverplus  Kawazoeさんからの数学の問題
# 「デジタル・タブー」問題
# https://codeiq.jp/ace/kawazoe/q1206

# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"


except = [0, 3, 6, 9]

=begin
i = 1
count = 0
loop do
#while i <= 1000000
  num =  i.to_s.split('').collect {|i|i.to_i}
  if num.length == (num - except).length
    count += 1
    #print "#{count}:#{i}\n"
    break if count == 10 ** 7
  end
  i += 1
end
print "#{count}:#{i}\n"
=end

n = 10
number = 6
while number <= 10 ** 7
  n *= 10
  number = number + 6 * 6 * 6 ** (n.to_s.length-3)
  print "1-#{n}:#{number}\n"
end


# 6 進数に変換
def to_senary(n)
  num = []
  while n > 0
    num.unshift(n % 6)
    n = (n - n % 6) / 6
  end
  return num.join('').to_i
end

# 6 進数を変換
def encode(n)
  code = [8, 1, 2, 4, 5, 7]
  num = []
  while n > 0
    # 10 → 8 に変換するときに、繰り下げにより、桁の文字が 9 になっている場合がある
    # 配列の添字が 9 の場合は定義されていないので、このときには、7 に変換されるようにする
    if code[n % 10] == nil
      num.unshift(code[-1])
    else
      num.unshift(code[n % 10])
    end
    if n % 10 == 0
      n = (n - 10) / 10 # 10 → 8 の変換の場合
    else
      n = (n - n % 10) / 10
    end
  end
  return num.join('').to_i
end

n = 10 ** 7
p encode(to_senary(n))

=begin
(1..30000).each do |i|
  print "#{i}:#{calc(i)}\n"
end
p calc(10**7)
=end

# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
