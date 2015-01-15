# @stakemura  stakemuraさんからの言語不問の問題
# 1〜7の数字を式にあてはめよう 初級
# https://codeiq.jp/ace/stakemura/q1211


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

min = -1
sets = (1..7).to_a.permutation
min_set = []
sets.each do |set|
  next if set[0] == 1
  ans = Math.log(set[0]) * ((set[1] / 10 + set[2] / 10) ** (-(set[3] / 10)) - set[4] ** (-set[5] - set[6] / 10)) - 1
  if min == -1 || ans.abs < min
    min = ans.abs
    min_set = set
    #puts min
    #p set
  end
end
#p min_set

puts min_set[0] ** ((min_set[1] / 10 + min_set[2] / 10) ** (-(min_set[3] / 10)) - min_set[4] ** (- min_set[5] - min_set[6] / 10))

puts min_set.join(" ")

# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
