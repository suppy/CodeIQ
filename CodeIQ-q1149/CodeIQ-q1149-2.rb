# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：同じ数字で挟み撃ち
# https://codeiq.jp/ace/thisweek_masuipeo/q1149


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

# 手順1. 「n」のカードからスタートする
# 手順2. 2枚のカードが置ける並べ方を見つける
# 手順3. 2枚のカードを置く
# 手順4. カードの数字を１つ小さくする
# 手順5. すべてのカードが並べられたら終了。それ以外は手順2に戻る

n = 11

# カードか並べられていない状態を初期値にする
cards = Array.new(2 * n, 0)
cards_patterns = [cards]

# 「n」のカードからスタート
card_number = n
while card_number > 0
  next_cards_patterns = []
  cards_patterns.each do |cards|
    # カードが置ける位置を見つけ、カードを置いた状態を次の状態に追加する
    (0...2*n).each do |i|
      break if i + card_number + 1 >= 2 * n
      if cards[i] == 0 && cards[i + card_number + 1] == 0
        next_cards = cards.clone
        next_cards[i] = card_number
        next_cards[i + card_number + 1] = card_number
        next_cards_patterns << next_cards
      end
    end
  end
  cards_patterns = next_cards_patterns
  # カードの数字を1つ減らす
  card_number -= 1
end
p cards_patterns.length



# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
