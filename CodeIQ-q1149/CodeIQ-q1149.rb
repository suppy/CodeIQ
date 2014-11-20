# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：同じ数字で挟み撃ち
# https://codeiq.jp/ace/thisweek_masuipeo/q1149


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"


n = 6
cards = []
(1..n).each do |i|
  cards << [i] * 2
end
cards.flatten!
p cards

cards_patterns = cards.permutation(cards.length).take(10000000).uniq
p cards_patterns.length

#exit

cards_patterns.each do |cards_pattern|
  pattern = true
  #p cards_pattern
  (1..n).each do |i|
    pos = cards_pattern.index(i)
    #print "#{i} pos #{pos}\n"
    if cards_pattern[pos + i + 1] != i
      pattern = false 
      break
    end
  end
  print "true #{cards_pattern}\n" if pattern == true
end


# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
