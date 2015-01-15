# CodeIQ運営事務局  アプリケーションエンジニアを募集する企業さんからのウチに来ない？の問題
# 言語不問：最後にチョコもらうのは誰？
# https://codeiq.jp/ace/joboffer_apli/q1107


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

count = 0
answer = []
#n = 5
n = 6
while count < 5
  table = []
  (1..n).each do |i|
    table << i
  end
  (1..n).each do |i|
    table << -(n-i+1)
  end
  #p table
  person = 0
  (2*n).times do
  #while table.length > 0
    person = table.shift
    #p person
    #p table
    table << person
    #p table
    person = table.shift
    break if person == n && table.length != 0 
    #print "#{person} "
    #p table
  end
  if person == n && table.length == 0
    #print "#{n} #{person}\n"
    #p person[1..-1].to_i
    count += 1
    answer << n
    #p n
  end
  n += 1
end
#p count
puts answer.join(", ")

# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
