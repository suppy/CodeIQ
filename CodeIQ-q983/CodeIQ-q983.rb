# CodeIQコード銀行  コードお預かり窓口さんからのウチに来ない？の問題
# コード銀行：n番目の数字は？
# https://codeiq.jp/ace/code_teller/q983

# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"


#problems = File.open("nthdigit\\sample.in.txt", "r"){ |f|
problems = File.open("nthdigit\\testdata.in.txt", "r"){ |f|
	f.map{ |line| line.strip.to_i }
}

#problem = problems[0]
problems.each do |problem|
#p problem
i = problem
j = 5
loop do
  if i - j.to_s.length <= 0
    print "#{problem}:#{j.to_s[i - j.to_s.length].to_i}\n"
    break
  end
  j += 1
  i -= j.to_s.length
end
end


# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
