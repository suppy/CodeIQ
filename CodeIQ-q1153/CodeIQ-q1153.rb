# Short Coder @ozy4dm  Ozy@アルゴリズムさんからの言語不問の問題
# 一番割り算の多い組み合わせは？
# https://codeiq.jp/ace/ozy_algorithm/q1153


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"


def count_euclid(num1, num2)
  num1, num2 = num2, num1 if num1 < num2
  count = 0
  loop do
    #print "#{num1}, #{num2}\n"
    num1, num2 = num2, num1 % num2
    count += 1
    break if num2 == 0
  end
  return count
end

#p count_euclid(120, 75)
#p count_euclid(8, 5)
n = 10 # 4 8 5
n = 100 # 9 89 55
n = 300 # 11 233 144
n = 1234 # 14 987 610
n = 123456
n = 1234567890
p n
max_count = 0
max_nums = []
(2..n).each do |num1|
  (2...num1).each do |num2|
    #print "#{num1}:#{num2}\n"
    count = count_euclid(num1, num2)
    if max_count < count
      max_count = count
      max_nums = [num1, num2] # 複数見つかった場合は、その中の1例のみで構いません
      print "#{max_count} #{max_nums.join(" ")}\n"
    end
  end
end
print "#{max_count} #{max_nums.join(" ")}\n"


# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
