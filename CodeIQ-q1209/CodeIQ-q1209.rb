# @iskmsy  井関 正也さんからのアルゴリズムの問題
# 割れる数の個数は？
# https://codeiq.jp/ace/iseki_masaya/q1209


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

# ある整数Ｎを素因数分解したときに
# Ｎ＝Ａ^ｐ×Ｂ^ｑ×Ｃ^ｒ……
# となったとき
# 約数の個数は
# （ｐ＋１）×（ｑ＋１）×（ｒ＋１）×……
# となります。

require 'prime'

def divisor_num(n)
  divisor_num = 1
  Prime.prime_division(n).each do |divisor|
    divisor_num *= divisor[1] + 1
  end
  return divisor_num
end

# 例
n = 20
p divisor_num(n)

# 問１
n = 472
p divisor_num(n)

# 問２
n = 1073741824
n = 2 ** 30
p divisor_num(n)

# 問３
n = 3572947927495273
p divisor_num(n)



# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
