# @riverplus  Kawazoeさんからの数学の問題
# 「リターン・ナンバー」問題
# https://codeiq.jp/ace/kawazoe/q1121


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"


# 212890625
# 787109376

=begin
#(100000000..999999999).each do |i|
(100000000..999999999).each do |i|
#  next i % 10 != 1 || i % 10 != 5 || i % 10 != 6
  p i if (i * i) % 1000000000 == i
end
=end

num_set = (0..9).to_a
(1...9).each do |keta|
  next_num_set = []
  num_set.each do |i|
    (0..9).each do |j|
      next_num = j * 10 ** keta + i
      next_num_set << next_num if next_num * next_num % 10 ** (keta+1) == next_num

    end
  end
  num_set = next_num_set
end
num_set.delete_if{|num| num.to_s.length != 9} # 9桁になっていない数（0, 1）は削除
puts num_set.join(",")


# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
