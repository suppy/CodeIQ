# @riverplus  Kawazoeさんからの数学の問題
# 「ピッキング・カード」問題
# https://codeiq.jp/ace/kawazoe/q1219


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

=begin
@num = 7
@pick_num = 3


@count = 0

def search(i, sum, k)
  print "#{i}:#{sum}:#{k}\n "
  if sum != 0 && sum % @num == 0 && k == @pick_num
    @count += 1
    print "\n"
    return
  end
  return if i >= @num
  search(i + 1, sum, k)
  search(i + 1, sum + i, k + 1) if sum + i <= @num && k + 1 <= @pick_num
end


#search(1, 0, 0)
=end



# num個の合計がsumとなる組み合わせの数がCとなる場合、
# 以下のハッシュを定義する
#  h[[sum, num]] = C
h = Hash.new(0)
h[[0, 0]] = 1

n = 103
pick_num = 8
(1..n).each do |i|
  next_h = h.clone
  h.each do |key, value|
    #print "i=#{i} #{key},#{value}\n" if key[0] % n == 0
    next_h[[(key[0] + i) % n, key[1] + 1]] += value if key[1] < pick_num
    #print "next_h:#{next_h}\n"
  end
  h = next_h
  #p h
end

#p h.length
h.each do |key, value|
  #print "#{key}:#{value}\n" if key[0] % n == 0 && key[1] == pick_num 
  print "#{value}\n" if key[0] % n == 0 && key[1] == pick_num 
end

#p @count


# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
