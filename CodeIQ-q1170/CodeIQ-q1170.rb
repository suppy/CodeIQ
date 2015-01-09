# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：隣り合わないのがマナー？
# https://codeiq.jp/ace/thisweek_masuipeo/q1170


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"



# 隣の席に人が座っているかを調べる
#  true :座っている
#  false:座っていない
def neighbor?(seats, index)
  return false if index == 0 && seats[1] == 0
  return false if index == @n-1 && seats[@n-2] == 0
  return false if index == @n/2-1 && seats[@n/2-2] == 0
  return false if index == @n/2 && seats[@n+1] == 0
  return false if seats[index-1] == 0 && seats[index+1] == 0

  return true  
end

# 隣り合わずに座れるかを調べる
#  true :座れない
#  false:座れる
def full?(seats)
  (0...@n).each do |i|
    next if seats[i] != 0 # 席に人が座っているとき
    return false if !neighbor?(seats, i) # 隣の席に人が座っていないとき
  end
  return true
end

# 座れる席を再帰で探索する
def search(seats, order)
  if order == @n # 全員が座れたとき
    @count += 1
    return
  end
  (0...@n).each do |i|
    next if seats[i] != 0 # 席に人が座っているとき
    if !neighbor?(seats, i) || full?(seats) # 隣の席に人が座っていない、または、隣り合わずに座れないとき
      # 席に座る
      next_seats = seats.clone
      next_seats[i] = order 
      search(next_seats, order + 1)
    end
  end
end

@n = 12
seats = [0] * @n

@count = 0
search(seats, 1)
p @count

#p seats
#seats = [1,0,1,0,1,0,1,0,1,0,0,0]
#p seats
#p full?(seats)

# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
