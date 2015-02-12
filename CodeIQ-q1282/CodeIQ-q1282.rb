# coding: sjis
# @Nabetani  鍋谷 武典さんからの数学の問題
# 中学入試から：概数と計算
# https://codeiq.jp/ace/nabetani_takenori/q1282


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

require 'bigdecimal'

# ファイルから問題を読み込む
def load_problems(filename)
  problems = File.open(filename, "r"){ |f|
    f.map{ |line| line.strip.split(' ') }
  }
  return problems
end


def calc_range(x, n, round)
  #p BigDecimal(x.to_s) * (10 ** (n-1)) - (BigDecimal(x.to_s) * (10 ** (n - 1))).floor
  if BigDecimal(x.to_s) * (10 ** (n - 1)) - (BigDecimal(x.to_s) * (10 ** (n - 1))).floor != 0
    #puts "Inf"
    return Float::INFINITY, false, Float::INFINITY, false
  end

  x = BigDecimal(x.to_s) * (10 ** (n - 1))

  case round
  when "四捨五入"
    min, max = x - 0.5, x + 0.5
    eq_min, eq_max = true, false
  when "切り上げ"
    min, max = x - 1, x
    eq_min, eq_max = false, true
  when "切り捨て"
    min, max = x, x + 1
    eq_min, eq_max = true, false
  else
    min, max = 0, 0
  end

  min /= 10 ** (n - 1)
  max /= 10 ** (n - 1)
#print "#{min.to_f} #{x.to_f/(10 ** (n - 1))} #{max.to_f}\n"
#p x.class
#p min.class
#p max.class
  return min.to_f, eq_min, max.to_f, eq_max
end


def calc_range2(min, max, scale, n, n0, round1, round2)
print "#{min} #{max}\n"
  #p scale
  min = BigDecimal.new(min.to_s) / BigDecimal.new(scale)
  print "#{min.to_f} "
  #p min.class
  #puts min * BigDecimal((10.0 ** (n - 1)).to_s)
  #puts BigDecimal(((min * (10.0 ** (n - 1))).ceil).to_s)
  diff = min * (BigDecimal("10") ** (n - 1)).ceil - min * (BigDecimal("10") ** (n - 1))
  #p diff.class
#  print "丸め #{diff} "
  if diff == 0
    min_flag = 0
  else
    min_flag = 1
  end
  #if round1 != "切り上げ"
    min = (min * (10.0 ** (n - 1))).ceil
  #else
  #  min = (min * (10.0 ** (n - 1)))
  #end
  #  p min
  min = min / (10.0 ** (n - 1))
#  p min
  min_min, eq_min, min_max, eq_max = calc_range(min, n, round1)
  if min_min == Float::INFINITY
    return Float::INFINITY, false, Float::INFINITY, false
  end
  
  max = BigDecimal.new(max.to_s) / BigDecimal.new(scale)
  #p max
  print "#{max.to_f}\n"
  diff = (max * (BigDecimal("10") ** (n - 1))) - (max * (BigDecimal("10") ** (n - 1))).floor
  if diff == 0
    max_flag = 0
  else
    max_flag = 1
  end
#  print "#{diff}\n"
  max = (max * (10.0 ** (n - 1))).floor
  max = max / (10.0 ** (n - 1))
#  p max
  max_min, eq_min, max_max, eq_max = calc_range(max, n, round1)
  if max_min == Float::INFINITY
    return Float::INFINITY, false, Float::INFINITY, false
  end
#  print "フラグ #{min_flag} #{max_flag}\n"
print "#{min} #{max}\n"
print "#{min_min}, #{min_max}, #{max_min}, #{max_max}\n"
print "#{round1} #{round2}\n"

#  if min_min > max_min && min_max > max_max && (round2 == "四捨五入" || round2 == "切り捨て") && (round1 == "切り上げ" || round1 == "四捨五入")
#  if min_min > max_min && min_max > max_max
  if min_min > max_min && min_max > max_max && round2 == "四捨五入"
    return Float::INFINITY, false, Float::INFINITY, false
  end

  if min_flag == 0 && max_flag == 1 && min_min > max_min && min_max > max_max && round1 = "切り上げ" && round2 == "切り捨て"
  #  return Float::INFINITY, false, Float::INFINITY, false
  end
  
  if min_min == max_min && min_max == max_max
#    return Float::INFINITY, false, Float::INFINITY, false
  end

  if min > max && round1 == "切り上げ" #&& round2 == "切り捨て"
    return Float::INFINITY, false, Float::INFINITY, false # T35のためコメント
  end
  
  if n == n0
    min = min_min # データID:11
  end
  
  if min_flag == 0 && round2 == "切り上げ"
    #min = min_max
  else
    #min = min_min
  end
  
  if min_flag == 0 && max_flag == 0 && round1 == "切り上げ" && round2 == "切り上げ"
    #min = min_max
  else
    min = min_min
  end
  
  if max_flag == 1 || round2 == "切り上げ"
    max = max_max
  else
    max = max_min
  end


  if min_max > max_min
    min = min_min
    #max = max_max
  end
  

  if min_min > max_min 
    min = max_min
  end

  if min_max == max_min
    min = min_min
  end
  
  case round1
  when "四捨五入"
    eq_min, eq_max = true, false
  when "切り上げ"
    eq_min, eq_max = false, true
  when "切り捨て"
    eq_min, eq_max = true, false
  end

  return min, eq_min, max, eq_max
end

def join_answer(min, eq_min, max, eq_max)
  return "なし" if min == Float::INFINITY
  answer = ""
  min = (/(\d+\.??\d*?)\.?0*\z/.match(min.to_f.to_s))[1]
  answer += min
  if eq_min
    answer += "以上"
  else
    answer += "より大きく"
  end
  max = (/(\d+\.??\d*?)\.?0*\z/.match(max.to_f.to_s))[1]
  answer += max
  if eq_max
    answer += "以下"
  else
    answer += "未満"
  end
  return answer
end

def calc(x, figure1, round1, scale, figure2, round2)
  x *= 10.0 ** (figure1 - 1)
  case round1
  when "四捨五入"
    x = x.round
  when "切り上げ"
    x = x.ceil
  when "切り捨て"
    x = x.floor
  end
  x /= 10.0 ** (figure1 - 1)
  #p x
  x *= BigDecimal(scale.to_s)
  #p x
  x *= 10.0 ** (figure2 - 1)
  case round2
  when "四捨五入"
    x = x.round
  when "切り上げ"
    x = x.ceil
  when "切り捨て"
    x = x.floor
  end
  #p x
  x /= 10.0 ** (figure2 - 1)
  #p x
  #p x.to_f
  #p answer
  #return true if x.to_f == answer.to_f
  #return false
  return x.to_f
end

#p calc(24.995, 3, "四捨五入", 1.7, 1, "四捨五入", 42)



#problems = load_problems("data.sjis.txt")

#problems.each do |problem|
#  p problem
#end

wrong_id = []
File.open("data.sjis.txt", "r") do |f|
  while line = f.gets
#puts line
  id, figure1, round1, scale, figure2, round2, x, right_answer = line.strip.split(' ')
#p scale
#p round2
min, eq_min, max, eq_max = calc_range(x.to_f, figure2.to_i, round2)

if min != Float::INFINITY
#print "1:#{min},#{max}\n"
min, eq_min, max, eq_max = calc_range2(min, max, scale, figure1.to_i, figure2.to_i, round1, round2)
#print "2:#{min},#{max}\n"
end
=begin
if !calc(min_min, figure1.to_i, round1, scale.to_f, figure2.to_i, round2, x.to_f)
  min = min_max
else
  min = min_min
end
if !calc(max_max, figure1.to_i, round1, scale.to_f, figure2.to_i, round2, x.to_f)
  max = max_min
else
  max = max_max
end
=end

answer = join_answer(min, eq_min, max, eq_max)

    if answer != right_answer
puts line
print "#{round1} #{round2}\n"
#print "#{calc(min, figure1.to_i, round1, scale.to_f, figure2.to_i, round2)} "
#print "#{calc(max, figure1.to_i, round1, scale.to_f, figure2.to_i, round2)}\n"
    puts answer
    puts right_answer
    #exit
    #exit if id == "22"
    #exit if id[0] != "T"
    wrong_id << id
    end
    #exit if id == "40"
  end
end
puts wrong_id.join(",")
exit

round = "四捨五入"
#round = "切り上げ"
min, eq_min, max, eq_max = calc_range(42, 1, round)
scale = 1.7
min_min, eq_min, max_min, eq_max = calc_range2(min, max, scale, 3, round)
print "#{min_min},#{max_min}\n"

# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
