# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：そろばんで足し算
# https://codeiq.jp/ace/thisweek_masuipeo/q1235


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

# 数値nをそろばんの玉の表現に変換
#  引数　:n
#  戻り値:[10の位の5の玉, 10の位の1の玉, 1の位の5の玉, 1の位の1の玉]
def abacus(n)
  return [n / 10 /5, n / 10 % 5, n % 10 / 5, n % 5]
end

#p abacus(11)
#p abacus(61)
#p abacus(99)

abacus_size = 2 * 2 # n桁 * 2 (5の玉と1の玉の2種類)

min_count = -1
min_set = []
(1..10).to_a.permutation.each do |set|
  #p set
  #set = [8,9]
  #set = [9,8]
  #set = [1,2,3,4,5,6,7,8,9,10]
  sum = 0
  count = 0
  set.each do |n|
    abacus_sum = abacus(sum)
    abacus_sum_next = abacus(sum + n)
    #p abacus(sum)
    #print "#{n}:#{sum} #{abacus(sum)} #{count}\n"
    (0...abacus_size).each do |i|
      count += (abacus_sum[i] - abacus_sum_next[i]).abs
    end
    sum += n
  end
  if min_count ==  -1 || min_count >= count
    min_count = count
    min_set = set
    #p min_count
    #p min_set
  end
  #p sum
  #p count
end
p min_count
#p min_set

# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
