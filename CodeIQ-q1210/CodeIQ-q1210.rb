# @iskmsy  井関 正也さんからのアルゴリズムの問題
# 組み合わせの数は？
# https://codeiq.jp/ace/iseki_masaya/q1210


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

=begin
例)
数列:(2,3,5)

答え:7
（値：2,3,5,6,10,15,30）


問1
(2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73)


問2
(2, 2, 2, 2, 11, 11, 11, 11, 23, 23)


問3
(2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3)


問4
(2, 2, 2, 2, 11, 11, 11, 11, 23, 23, 31, 37, 41, 43, 43, 53, 59, 61, 67, 67, 73, 199, 211, 211, 211, 211, 211, 211, 211, 211, 211, 263, 263, 263, 263, 263, 283, 283, 283, 311, 311, 311, 311, 337, 337, 349, 353, 359, 367, 373)

=end

num_set = [2, 3, 5]
num_set = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73]
num_set = [2, 2, 2, 2, 11, 11, 11, 11, 23, 23]
num_set = [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3]
num_set = [2, 2, 2, 2, 11, 11, 11, 11, 23, 23, 31, 37, 41, 43, 43, 53, 59, 61, 67, 67, 73, 199, 211, 211, 211, 211, 211, 211, 211, 211, 211, 263, 263, 263, 263, 263, 283, 283, 283, 311, 311, 311, 311, 337, 337, 349, 353, 359, 367, 373]

# 素因数分解と約数の個数
# http://buchiyamato.nomaki.jp/5jou2soinsuubunnkai.html

num = []
num_set.uniq.each do |i|
  num << num_set.count(i) + 1
end
p num.inject(:*) - 1 # 約数の 1 は除く

exit

h = {}
(1..num_set.length).each do |i|
  num_set.combination(i).each do |set|
    h[set.inject(:*)] = 1
  end
end
p h.length

# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
