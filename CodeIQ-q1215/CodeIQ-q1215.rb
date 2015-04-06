# The Essence of Programming  結城 浩さんからのアルゴリズムの問題
# サルベジオン社で宇宙船のデータを救え
# https://codeiq.jp/ace/yuki_hiroshi/q1215


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"



require 'net/http'
require 'uri'

def access_salvageon(db, index)
  url = URI.parse('http://salvageon.textfile.org/')
  res = Net::HTTP.start(url.host, url.port) do |http|
    http.get("/?db=#{db}&index=#{index}")
  end
  return res.body
end

# db 1

db = 1
index = 0

res = access_salvageon(db, index)
size = res.split(' ')[4].to_i

sleep 1

key_data = "K208050656559285601386927895421059705239114932023754"
start_index = 0
end_index = size - 1
loop do
  index = (end_index - start_index) / 2 + start_index

  res = access_salvageon(db, index)
  #p res
  key = res.split(' ')[2]
  #print "start:#{start_index}\nend  :#{end_index}\n"
  print "#{index}:#{key}\n"
  if key == key_data
    value = res.split(' ')[3]
    puts value
    break
  elsif key[1..-1].to_i < key_data[1..-1].to_i
    start_index = index
  else
    end_index = index
  end
  sleep 1
end


# db 2
db = 2
index = 0

res = access_salvageon(db, index)
size = res.split(' ')[4].to_i

sleep 1

key_data = "K2023636070998557444542586045"
=begin
10.times do |i|
  res = access_salvageon(db, i)
  index = res.split(' ')[1]
  key = res.split(' ')[2]
  print "#{index}:#{key}\n"
  sleep 1
end
10.times do |i|
  res = access_salvageon(db, size - 1 - i)
  index = res.split(' ')[1]
  key = res.split(' ')[2]
  print "#{index}:#{key}\n"
  sleep 1
end
=end
base_index = (size - 1) / 2
10.times do |i|
  res = access_salvageon(db, base_index + i)
  index = res.split(' ')[1]
  key = res.split(' ')[2]
  print "#{index}:#{key}\n"
  sleep 1
end


# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
