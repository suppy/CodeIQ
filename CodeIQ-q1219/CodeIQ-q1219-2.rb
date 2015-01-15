# @riverplus  Kawazoeさんからの数学の問題
# 「ピッキング・カード」問題
# https://codeiq.jp/ace/kawazoe/q1219


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

num = 13
pick_num = 5

h = Hash.new(0)
p h[0]


count = 0
(1..num).to_a.combination(pick_num).each do |set|
  #p set
  if set.inject(:+) % num == 0
    p set
    h[set.inject(:+)] += 1
    count += 1
  end
end
p count
p h

# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
