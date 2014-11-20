# @Nabetani  鍋谷 武典さんからの数学の問題
# 中学入試から：数字の個数
# https://codeiq.jp/ace/nabetani_takenori/q1138


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

=begin
a = 11
b = 100000000000000000
c = 0

num = 7

count = 0


a = 2
n = Math.log10(a)
p n
#p count_num(a, 1)


(0..9).each do |j|
  count = 0
  (1..a).each do |i|
    count += i.to_s.count(j.to_s)
  end
  print "#{j}:#{count}\n"
end
=end

count = 0
n = 308090
(1..n).each do |i|
  count += i.to_s.count("0")
    print "#{i}: #{count}\n" if i % 100 == 0

end
p count

#n = 9000000

# n = j * 10^i の形式の場合は以下の式で計算できる
# 10^n までの個数 
keta = n.to_s.length
count = 0
(0..keta-2).each do |i|
  count += i * 10 ** (i-1) * 9 + 1
end
#puts count
# n までの個数
count += (keta - 1) * 10 ** (keta - 2) * ((n / 10 ** (keta - 1)).floor - 1)
#puts count

def count0(n)
#print "n=#{n}\n"
  keta = n.to_s.length
  return 0 if keta <= 1 || n == 0
  # n = j * 10^i (i:i>=1,整数,j:1 <= j <= 9,整数) の形式の場合は以下の式で計算できる
  # n までの個数 
  count = 0
  (0..keta-2).each do |i|
    count += i * 10 ** (i-1) * 9 + 1
  end
  #puts count
  # n までの個数
  #p n
  #p keta
  count += (keta - 1) * 10 ** (keta - 2) * ((n/(10 ** (keta - 1))).floor - 1)
#  ('9 (n[-keta + 1] - 1)
  #print "count=#{count}\n"
#  count += count0(n % (10 ** (keta - 1)), keta - 1)
#  count += "123456789"[0, keta-1].to_i * 9 if n.to_s.length != keta
#  + "123456789"[0, keta-1].to_i * 9 
#  p n
#  p n[-keta+1..-1]
#  count += count0(n, keta-1)
  return count
end

#array_n = n.to_s.split('').collect{|s| s.to_i}
#p array_n

#p count0(array_n, array_n.length)
def count_num_0(n)
keta = n.to_s.length
count = 0
count += count0(n)
while keta > 0
  keta -= 1
  n %= 10**(keta)
  #print "n #{n}\n"
  if n == 0
    break
  elsif (n / 10**(keta-1)).floor != 0
    count += count0(n - n % 10**(keta-1))
    fill_0_num = 0
    1.upto(keta-1) do |i|
      fill_0_num *= 10
      fill_0_num += i
    end
    #p fill_0_num
    count += fill_0_num * 9
  else
    count += n % 10**(keta-1)
  end
end
#puts count

#exit
return count
end

def count_num(end_num, num_str)
  #return 0 if start_num > end_num
  #keta = Math.log10(end_num).floor + 1
  keta = end_num.to_s.length
  if keta == 1
    count = 0
    (1..end_num).each do |i|
      count += i.to_s.count(num_str.to_s)
    end
    return count
  end

  #if num_str != 0
  
  # n != 0 の場合
  # 例　<<33, n>> + ... + <<634, n>>
  #  <<1, C>> + <<2, C>> + ... + <<A, C>> を <<<A, C>>> と書くことにする
  #  次のように式変形する
  #   <<33, n>> + ... + <<634, n>>
  # = <<<634, n>>> - <<<32, n>>>
  # = <<<599, n>>> + (<<<634, n>>> - <<<600, n>>> - <<<32, n>>>
  # = <<<99, n>>> * 6 + <<<5, n>>> * 100 + (<<<6, n>>> - <<<5, n>>>) * (34 + 1) + <<<34, n>>> - <<<32, n>>>
  #   99までの個数 * 100の位の数字　+ 100の位が探す数字になっている個数 + 100の位が探す数字になっている個数で、この場合は500~534の個数　+ 34までの個数 - 32までの個数
  #
  # n != 0 の場合
  # <<<9, n>>> = 1
  # <<<99, n>>> = 20
  # <<<999, n>>> = 300
  #  ....
  # <<<99....99, n>>> = 10 ** (99....99 の桁数 - 1) * (99....99 の桁数)
  #
  # 上記を適用すると
  # = 10 ** (99 の桁数 - 1) * (99 の桁数) * 6 + <<<5, n>>> * 100 + (<<<6, n>>> - <<<5, n>>>) * (34 + 1) + <<<34, n>>> - <<<32, n>>>
  # = 10 ** (634 の桁数 - 2) * (634 の桁数 - 1) * 6 + <<<5, n>>> * 100 + (<<<6, n>>> - <<<5, n>>>) * (34 + 1) + <<<34, n>>> - <<<32, n>>>
    ans = 10**(keta-2) * (keta-1) * (end_num/(10**(keta-1))).floor
    ans += count_num(end_num/(10**(keta-1)) - 1, num_str) * (10**(keta-1))
    ans += (count_num(end_num/(10**(keta-1)), num_str) - count_num(end_num/(10**(keta-1))-1, num_str)) * (end_num%(10**(keta-1)) + 1)
    ans += count_num(end_num%(10**(keta-1)), num_str)
    #ans -= count_num(start_num-1, num_str)
=begin  
    ans = 10**(keta-2) * (keta-1) * (end_num/(10**(keta-1))).floor
    ans += count_num(1, end_num/(10**(keta-1)) - 1, num_str) * (10**(keta-1))
    ans += count_num(end_num/(10**(keta-1)), end_num/(10**(keta-1)), num_str) * (end_num%(10**(keta-1)) + 1)
    ans += count_num(1, end_num%(10**(keta-1)), num_str)
    ans -= count_num(1, start_num-1, num_str)
  #  ans = 10 ** (keta-1) * keta + num_str==(end_num/(10 ** (keta-1))).floor ? (10**(keta-1) + end_num%(10**(keta-1))) + 1 : 0 + count_num(1, end_num%(10**(keta-1)), num_str)
=end
    return ans
  #end
  
  #ans = count_num(1, end_num.to_s[0].to_i * (10 ** keta-1) - 1, num_str)
end

=begin 
(0..9).each do |n|
#  p n
  print "#{n}:count #{count_num(1, a, n)}\n"
end
=end

#p count_num(10833228364507232,15236979472080112,7)


# ファイルから問題を読み込む
def load_problems(filename)
  problems = File.open(filename, "r"){ |f|
    f.map{ |line| line.strip.split(' ') }
  }
  return problems
end


problems = load_problems("data.txt")

wrong_id =[]
problems.each do |problem|
  #p problem
  id = problem[0]
  start_num, end_num, num_str = problem[1].split(",")
  answer = problem[2].to_i
  if num_str == "0"
    if answer != count_num_0(end_num.to_i) - count_num_0(start_num.to_i - 1)
      #print "#{count_num_0(end_num.to_i)} #{count_num_0(start_num.to_i - 1)}\n"
      wrong_id << id
      print "#{id} #{num_str}\n"
      #break if id = "T07"
    end
  elsif answer != count_num(end_num.to_i, num_str.to_i) - count_num(start_num.to_i-1, num_str.to_i)
    wrong_id << id
    print "#{id} #{num_str}\n"
  end
end
#puts wrong_id.join(",")


# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
