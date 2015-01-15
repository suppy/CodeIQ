# @stakemura  stakemuraさんからの言語不問の問題
# 1〜8の数字を式にあてはめよう 上級
# https://codeiq.jp/ace/stakemura/q1190


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

min = -1
sets = (1..8).to_a.permutation

sets.each do |set|
  ans = Math.log(set[0] + set[1] ** (-set[2] * 10 - set[3])) * (set[4] ** (set[5] * 10 + set[6]) + set[7] / 10)
  if min == -1 || ans < min
    min = ans
    p min
    p set
  end
end


# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
