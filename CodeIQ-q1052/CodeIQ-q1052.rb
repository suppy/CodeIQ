# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：同時に着くのは何通り？
# https://codeiq.jp/ace/thisweek_masuipeo/q1052


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

@n = 10 

def move_a(pos_a)
  pos_a_next = []
  pos_a.each do |pos|
    (1..4).each do |i|
      pos_a_next << pos + i if pos + i <= @n
    end
  end
  return pos_a_next
end

def move_b(pos_b)
  pos_b_next = []
  pos_b.each do |pos|
    (1..4).each do |i|
      pos_b_next << pos - i if pos - i >= 0
    end
  end
  return pos_b_next
end


pos_a = [0]
pos_b = [@n]

count = 0
(@n/2).times do
  pos_a = move_a(pos_a)
  pos_b = move_b(pos_b)
  # 現在のAの位置それぞれについて、Bの位置が同じ個数を足し合わせる
  pos_a.each do |pos|
    count += pos_b.count(pos)
  end
end
p count

# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
