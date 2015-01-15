# CodeIQ運営事務局  アプリケーションエンジニアを募集する企業さんからのウチに来ない？の問題
# 言語不問：3桁のフィボナッチ数列
# https://codeiq.jp/ace/joboffer_apli/q1129


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

#n = 12
#fibo = (((1 + Math.sqrt(5))/2)**n - ((1 - Math.sqrt(5))/2)**n)/Math.sqrt(5)
#p fibo

# 3桁のフィボナッチ数列が循環するときの項数を求める
fibonacchi = {}
fibo0 = 0
fibo1 = 1
loop_count = 0
loop do
  #print "n=#{n} #{fibo0}\n"

  fibo1, fibo0 = (fibo1 + fibo0) % 1000, fibo1
  if fibonacchi[[fibo1, fibo0]] == 1
    break
  else
    fibonacchi[[fibo1, fibo0]] = 1
  end
=begin
  if fibo1 == 970
    p fibo1
    break
  end
=end
  loop_count += 1
end
#p loop_count

#exit

# 問題を読み込む
input_data = []
#filename = "fibo3d\\sample.in.txt"
filename_in = "fibo3d\\testdata.in.txt"
filename_out = "fibo3d\\testdata.out.txt"
File.open(filename_in, "r") do |f|
  num = f.gets.strip.to_i
  num.times do |i|
    input_data << f.gets.strip.to_i
  end
end

n = 0
n = 1
n = 2
n = 3
n = 4
n = 5
#n = 100
#n = 12345
#n = 1234567
#n = 33333
output_data = []
input_data.each do |n|
  # 求める解は、循環する項数で割った余りの項番と等しくなる
  n = n % loop_count
  #690

  #print "n=#{n}\n"

  # n 番目の項を求める
  fibo0 = 0
  fibo1 = 1
  i = 0
  while i < n
  #loop do
  #p fibo0
    fibo1, fibo0 = (fibo1 + fibo0) % 1000, fibo1
    i += 1
    #print "#{i} #{fibo1}\n" if fibo1 % 1000 == 853
  end
  p fibo0
  output_data << fibo0
end
File.open(filename_out, "w") do |f|
  output_data.each do |data|
    f.puts data
  end
end


# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
