# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：30人31脚に挑戦！
# https://codeiq.jp/ace/thisweek_masuipeo/q1062


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

n = 30

# 並び方を格納する配列
arrange = []
arrange << [0] # 男
arrange << [1] # 女

(n-1).times do
  arrange_next = []
  arrange.each do |arr|
    arrange_next << arr.clone.push(0) # 並びに男を追加する
    if arr[-1] != 1 # 前が女でなければ
      arrange_next << arr.clone.push(1) # 並びに女を追加する 
    end
  end
  arrange = arrange_next
end

p arrange.length



# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
