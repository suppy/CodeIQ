# CodeIQコード銀行  コードお預かり窓口さんからのウチに来ない？の問題
# コード銀行：「7」の数を数えよう
# https://codeiq.jp/ace/code_teller/q893

# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

n = 99 # 20 # 処理時間：0.007395 sec
n = 77777 # 38890 # 処理時間：0.028029 sec
n = 23678947 # 16140633 # 処理時間：7.067056 sec
n = 732465890 # 614891670 # 処理時間：225.917157 sec
n = 1912478368 # 1728439836 # 処理時間：1062.017153 sec
p n
num = 0
(1..n).each do |i|
	num += i.to_s.count("7")
end
p num
#p str.count("7")

# 処理終了時刻
t1 = Time.now
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
