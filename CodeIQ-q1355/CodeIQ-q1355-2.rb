# @riverplus  Kawazoeさんからの数学の問題
# 「フィーバー・ナンバー」問題
# https://codeiq.jp/ace/kawazoe/q1355


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

n = 6 # 同じ数字が並ぶ個数

i = 1
loop do
  (0..8).each do |j|
    num1 = (i.to_s + "." + j.to_s * n).to_f ** 2
    num2 = (i.to_s + "." + j.to_s * (n - 1) + (j + 1).to_s).to_f ** 2
    if num1 < num2.floor
      puts num2.floor
      exit
    end
  end
  num1 = (i.to_s + "." + "9" * n).to_f ** 2
  num2 = i ** 2
  if num1 <= num2.floor
    puts num2.floor
    exit
  end
  
  i += 1
end


# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
