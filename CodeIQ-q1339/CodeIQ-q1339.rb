# @riverplus  Kawazoeさんからの数学の問題
# 「ブラック・ブロック」問題
# https://codeiq.jp/ace/kawazoe/q1339


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

@n = 6
@m = 4

def check(pattern)
  max_stone_num = 0
  arr = pattern.split("0")
  arr.each do |pat|
    if pat.length > @m
      return false
    end
  end
  return true
end

p check("00001100011110")

p "00001100011110".split("0")


patterns = [""]
@n.times do |i|
  next_patterns = []
  patterns.each do |pattern|
    ["0", "1"].each do |stone|
      next_pattern = pattern + stone
      next if !check(next_pattern)
      next_patterns << next_pattern
    end
  end
  patterns = next_patterns
end

p patterns
p patterns.length

@sequence_num = 3
def func(stone_num, black_num, is_sequence)
  count = 0
  
end

# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
