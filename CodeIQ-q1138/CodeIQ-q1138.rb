# @Nabetani  鍋谷 武典さんからの数学の問題
# 中学入試から：数字の個数
# https://codeiq.jp/ace/nabetani_takenori/q1138


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

a = 11
b = 100000000000000000
c = 0

num = 7

count = 0


a = 2
n = Math.log10(a)
p n
#p count_num(a, 1)


(0..9).each do |j|
  count = 0
  (1..a).each do |i|
    count += i.to_s.count(j.to_s)
  end
  print "#{j}:#{count}\n"
end



def count_num(start_num, end_num, num_str)
  return 0 if start_num > end_num
  keta = Math.log10(end_num).floor + 1
=begin
  print "end_num #{end_num} keta #{keta}\n"
  if keta == 1
    if end_num < num_str
      return 1
    else
      return 0
    end
  end
=end
  if end_num.to_s.length == 1
    count = 0
    (start_num..end_num).each do |i|
      count += i.to_s.count(num_str.to_s)
    end
    return count
  end

  #if num_str != 0
    ans = 10**(keta-2) * (end_num.to_s.length-1) * end_num.to_s[0].to_i +
          count_num(1, end_num.to_s[0].to_i - 1, num_str) * (10**(keta-1)) +
          count_num(end_num.to_s[0].to_i, end_num.to_s[0].to_i, num_str) * (end_num.to_s[1..-1].to_i + 1) + 
          count_num(1, end_num.to_s[1..-1].to_i, num_str) -
          count_num(1, start_num-1, num_str)
  #  ans = 10 ** (keta-1) * keta + num_str==(end_num/(10 ** (keta-1))).floor ? (10**(keta-1) + end_num%(10**(keta-1))) + 1 : 0 + count_num(1, end_num%(10**(keta-1)), num_str)
    return ans
  #end
  
  #ans = count_num(1, end_num.to_s[0].to_i * (10 ** keta-1) - 1, num_str)
end

 
(0..9).each do |n|
#  p n
  print "#{n}:count #{count_num(1, a, n)}\n"
end

#p count_num(10833228364507232,15236979472080112,7)


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
  #p problem
  id = problem[0]
  start_num, end_num, num_str = problem[1].split(",")
  answer = problem[2].to_i
  if answer != count_num(start_num.to_i, end_num.to_i, num_str.to_i)
    wrong_id << id
    print "#{id} #{num_str}\n"
  end
end
#puts wrong_id.join(",")


# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
