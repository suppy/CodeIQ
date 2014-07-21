# CodeIQコード銀行  コードお預かり窓口さんからのウチに来ない？の問題
# コード銀行：「7」の数を数えよう
# https://codeiq.jp/ace/code_teller/q893

# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

def count7(n)
#	return 1 if n >= 7
#	return count7(n/10**(n.to_s.length-1)) * 10**(n.to_s.length-1) * n/10
	
=begin	
	10 => 1
	17 => 2
	20 => 2
	99 => 20
	100 => 20
	110 => 21
	117 => 22
	118 => 22
	1000 => 300
	10000 => 4000
	20000 => 8000
	100000 => 50000 0の数*10^(0の数-1) * 最上位桁
	699999 => 350000 桁数
	700000 => 350001
	800000 => 500000 0の数*10^(0の数-1) * 最上位桁 + 100000 (700000番台)
=end
	answer = 0
	n2 = n
	keta = n.to_s.length
	(0...keta).each do |i|
		answer += n2/(10 ** (keta - 1)) * 10 ** (keta - 1)
		n2 = n2 / 10
		
	end
	return answer
end
p count7(99)
exit

n = 99 # 20 # 処理時間：0.007395 sec
n = 77777 # 38890 # 処理時間：0.028029 sec
n = 23678947 # 16140633 # 処理時間：7.067056 sec
n = 732465890 # 614891670 # 処理時間：225.917157 sec
n = 1912478368 # 1728439836 # 処理時間：1062.017153 sec
n = 118
n = 700000
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
