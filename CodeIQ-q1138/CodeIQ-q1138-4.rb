# @Nabetani  鍋谷 武典さんからの数学の問題
# 中学入試から：数字の個数
# https://codeiq.jp/ace/nabetani_takenori/q1138


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

# 0 を数える
# ただし、n = j * 10^i (i:i>=1,整数,j:1 <= j <= 9,整数) の形式の場合
def count0(n)
  keta = n.to_s.length
  return 0 if keta <= 1 || n == 0
  
  # 10^i までの個数 
  count = 0
  (0..keta-2).each do |i|
    count += i * 10 ** (i-1) * 9 + 1
  end
  # 10^i + 1 から j * 10^i までの個数
  count += (keta - 1) * 10 ** (keta - 2) * ((n/(10 ** (keta - 1))).floor - 1)
  return count
end

# 0 を数える
def count_num_0(n)
  keta = n.to_s.length
  count = 0
  count += count0(n)
  while keta > 0
    keta -= 1
    n %= 10**(keta)
    if n == 0
      break
    elsif (n / 10**(keta-1)).floor != 0 # 計算する位の数が 0 ではないとき
      # 例
      # 1～11110 の場合は、以下の総和になる
      #   1～10000 の個数
      # + 1～ 1000 の個数 + 10001～11000 の間の千、百、十の位を埋める 0 の数（123*9)
      # + 1～  100 の個数 + 11001～11100 の間の   百、十の位を埋める 0 の数（12*9)
      # + 1～   10 の個数 + 11101～11110 の間の      十の位を埋める 0 の数（1*9)
      
      # 位より下の値で 0 を数える
      count += count0(n - n % 10**(keta-1))
      # 位を埋める 0 の数
      fill_0_num = 0
      1.upto(keta-1) do |i|
        fill_0_num *= 10
        fill_0_num += i
      end
      fill_0_num *= 9
      count += fill_0_num
    else
      count += n % 10**(keta-1) # 計算する位の数が 0 のときは、位より下の値の個数だけ 0 が並ぶ
    end
  end

  return count
end

def count_num(end_num, num_str)
  keta = end_num.to_s.length
  if keta == 1
    return (1..end_num).to_a.count(num_str) 
  end

  # n != 0 の場合
  # 例　<<33, n>> + ... + <<634, n>>
  #  <<1, C>> + <<2, C>> + ... + <<A, C>> を <<<A, C>>> と書くことにする
  #  次のように式変形する
  #   <<33, n>> + ... + <<634, n>>
  # = <<<634, n>>> - <<<32, n>>>
  # = <<<599, n>>> + (<<<634, n>>> - <<<600, n>>> - <<<32, n>>>
  # = <<<99, n>>> * 6 + <<<5, n>>> * 100 + (<<<6, n>>> - <<<5, n>>>) * (34 + 1) + <<<34, n>>> - <<<32, n>>>
  #   99までの個数 * 100の位の数字　+ 100の位が探す数字になっている個数 + 100の位が探す数字になっている個数で、この場合は500~534の個数　+ 34までの個数 - 32までの個数
  #
  # n != 0 の場合
  # <<<9, n>>> = 1
  # <<<99, n>>> = 20
  # <<<999, n>>> = 300
  #  ....
  # <<<99....99, n>>> = 10 ** (99....99 の桁数 - 1) * (99....99 の桁数)
  #
  # 上記を適用すると
  # = 10 ** (99 の桁数 - 1) * (99 の桁数) * 6 + <<<5, n>>> * 100 + (<<<6, n>>> - <<<5, n>>>) * (34 + 1) + <<<34, n>>> - <<<32, n>>>
  # = 10 ** (634 の桁数 - 2) * (634 の桁数 - 1) * 6 + <<<5, n>>> * 100 + (<<<6, n>>> - <<<5, n>>>) * (34 + 1) + <<<34, n>>> - <<<32, n>>>
  ans = 10**(keta-2) * (keta-1) * (end_num/(10**(keta-1))).floor
  ans += count_num(end_num/(10**(keta-1)) - 1, num_str) * (10**(keta-1))
  ans += (count_num(end_num/(10**(keta-1)), num_str) - count_num(end_num/(10**(keta-1))-1, num_str)) * (end_num%(10**(keta-1)) + 1)
  ans += count_num(end_num%(10**(keta-1)), num_str)
  return ans
end



# ファイルから問題を読み込む
def load_problems(filename)
  problems = File.open(filename, "r"){ |f|
    f.map{ |line| line.strip.split(' ') }
  }
  return problems
end


problems = load_problems("data.txt")

wrong_id =[]
problems.each do |problem|
  id = problem[0]
  start_num, end_num, num_str = problem[1].split(",")
  answer = problem[2].to_i
  if num_str == "0"
    if answer != count_num_0(end_num.to_i) - count_num_0(start_num.to_i - 1)
      wrong_id << id
    end
  elsif answer != count_num(end_num.to_i, num_str.to_i) - count_num(start_num.to_i-1, num_str.to_i)
    wrong_id << id
  end
end
puts wrong_id.join(",")


# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
