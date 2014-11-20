# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：シャッフルして元通り
# https://codeiq.jp/ace/thisweek_masuipeo/q1099


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

n_max = 100

# シャッフル
def shuffle(cards)
  cards_next = []
  (0...cards.length/2).each do |i|
    cards_next << cards[i]
    cards_next << cards[cards.length/2+i]
  end
  return cards_next
end

# 元に戻ったかの判定
def finish?(cards)
  cards_finish = (1..cards.length).to_a
  return true if (cards <=> cards_finish) == 0
  return false
end

ans = 0
(1..n_max).each do |i|
  cards = (1..2*i).to_a
  cards = shuffle(cards)
  count = 1
  while !finish?(cards)
    cards = shuffle(cards)
    count += 1
  end
  ans += 1 if count == 2 * (cards.length/2 - 1)
end
p ans

# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
