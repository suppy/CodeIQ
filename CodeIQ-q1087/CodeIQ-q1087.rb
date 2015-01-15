# CodeIQコード銀行  コードお預かり窓口さんからのウチに来ない？の問題
# コード銀行：ヒット・アンド・ブロー
# https://codeiq.jp/ace/code_teller/q1087


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"


def load_problems(filename)
  problems = []
  File.open(filename, "r") do |f|
    n = f.gets.strip.to_i
    #p n
    n.times do
      problems << f.gets.strip.split(" ")
    end
  end
  #p problems
  return problems
end

#filename = "./hit_and_blow/sample.in.txt"
filename = "./hit_and_blow/testdata.in.txt"
problems = load_problems(filename)
p problems

#problem = problems[0]
problems.each do |problem|
  answer, expect_answer = problem[0], problem[1]

  hit = 0
  (0...answer.length).each do |i|
    hit += 1 if answer[i] == expect_answer[i]
  end

  blow = 0
  (0...expect_answer.length).each do |i|
    next if answer[i] == expect_answer[i]
    blow += 1 if answer.index(expect_answer[i])
  end
  print "#{answer} #{expect_answer} "
  print "#{hit}H#{blow}B\n"
end

# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
