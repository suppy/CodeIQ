# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：受難のファサードの魔方陣
# https://codeiq.jp/ace/thisweek_masuipeo/q1181


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

magic_square = [1, 14, 14, 4,
                11, 7, 6, 9,
                8, 10, 10, 5,
                13, 2, 3, 15]

count = Hash.new(0)
(1..magic_square.length).each do |i|
  magic_square.combination(i).to_a.each do |nums|
    count[nums.inject(:+)] += 1
  end                
end
p count.sort{|a, b| -(a[1] <=> b[1])}[0][0]


# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
