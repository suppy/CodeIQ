# @yabuki  矢吹 太朗さんからのデータサイエンスの問題
# 基本の確認　2列の合計値比較
# https://codeiq.jp/ace/yabuki_taro/q1123


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

require 'bigdecimal'

def read_values(filename)
  problem = []
  File.open(filename, "r") do |f|
    while line = f.gets
      problem << line.strip.split(",").map{|item| item}
    end
  end

  col1 = []
  col2 = []
  problem.each do |value|
    col1 << value[0]
    col2 << value[1]
  end
  #p col1
  return col1, col2
end

def sum(values)
  sum = BigDecimal.new("0")
  values.each_with_index do |value, idx|
    sum += BigDecimal(value)
  end
  return sum
end

def show_judgement(sum1, sum2)
  print "#{sum1} "
  if sum1 > sum2
    print ">"
  elsif sum1 < sum2
    print "<"
  else
    print "="
  end
  print " #{sum2}\n"

end

filenames = ["q1.csv", "q2.csv", "q3.csv"]
filenames.each do |filename|
  col1, col2 = read_values(filename)
  sum1 = sum(col1)
  sum2 = sum(col2)
  show_judgement(sum1, sum2)
end

# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
