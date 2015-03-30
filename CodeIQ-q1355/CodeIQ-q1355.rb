# @riverplus  Kawazoeさんからの数学の問題
# 「フィーバー・ナンバー」問題
# https://codeiq.jp/ace/kawazoe/q1355


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

i = 2
loop do
  decimal = Math.sqrt(i).to_s.split(".")[1]
  if decimal == "0"
    i += 1
    next
  end
  #puts Math.sqrt(i)
  #puts Math.sqrt(i).to_s.split(".")[1][0, 6]
  #p Math.sqrt(i).to_s.split(".")[1][0, 6].split('').uniq
  break if decimal[0, 6].split('').uniq.length == 1
  i += 1
end
puts i
puts Math.sqrt(i)


# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
