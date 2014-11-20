# Sexy Coder  マシューさんからの言語不問の問題
# 美女の仕掛けた「セクシー素数」
# https://codeiq.jp/ace/matthew/q1092

require 'prime'

# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

sexy_prime = []
(1..500-6).each do |i|
  sexy_prime << "(#{i},#{i+6})" if i.prime? && (i+6).prime?
end
puts sexy_prime.join(", ")


# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
