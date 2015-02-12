# coding: sjis
# @Nabetani  ��J ���T���񂩂�̐��w�̖��
# ���w��������F�T���ƌv�Z
# https://codeiq.jp/ace/nabetani_takenori/q1282


# �����J�n����
t0 = Time.now
puts "�����J�n�����F#{t0}"
print "\n"

require 'bigdecimal'

# �t�@�C���������ǂݍ���
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
  when "�l�̌ܓ�"
    min, max = x - 0.5, x + 0.5
    eq_min, eq_max = true, false
  when "�؂�グ"
    min, max = x - 1, x
    eq_min, eq_max = false, true
  when "�؂�̂�"
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
  #p scale
  min = BigDecimal.new(min.to_s) / BigDecimal.new(scale)
  #p min.class
  #puts min * BigDecimal((10.0 ** (n - 1)).to_s)
  #puts BigDecimal(((min * (10.0 ** (n - 1))).ceil).to_s)
  diff = min * (BigDecimal("10") ** (n - 1)).ceil - min * (BigDecimal("10") ** (n - 1))
  #p diff.class
#  print "�ۂ� #{diff} "
  if diff == 0
    min_flag = 0
  else
    min_flag = 1
  end
  #if round1 != "�؂�グ"
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
#  print "�t���O #{min_flag} #{max_flag}\n"
print "#{min} #{max}\n"
print "#{min_min}, #{min_max}, #{max_min}, #{max_max}\n"
#print "#{round1} #{round2}\n"

#  if min_min > max_min && min_max > max_max && (round2 == "�l�̌ܓ�" || round2 == "�؂�̂�") && (round1 == "�؂�グ" || round1 == "�l�̌ܓ�")
#  if min_min > max_min && min_max > max_max
  if min_min > max_min && min_max > max_max && round2 == "�l�̌ܓ�"
    return Float::INFINITY, false, Float::INFINITY, false
  end

  if min_flag == 0 && max_flag == 1 && min_min > max_min && min_max > max_max && round1 = "�؂�グ" && round2 == "�؂�̂�"
  #  return Float::INFINITY, false, Float::INFINITY, false
  end
  
  if min_min == max_min && min_max == max_max
#    return Float::INFINITY, false, Float::INFINITY, false
  end

  if min > max
    #return Float::INFINITY, false, Float::INFINITY, false # T35�̂��߃R�����g
  end
  
  if n == n0
    min = min_min # �f�[�^ID:11
  end
  
  if min_flag == 0 && round2 == "�؂�グ"
    #min = min_max
  else
    #min = min_min
  end
  
  if min_flag == 0 && max_flag == 0 && round1 == "�؂�グ" && round2 == "�؂�グ"
    #min = min_max
  else
    min = min_min
  end
  
  if max_flag == 1 || round2 == "�؂�グ"
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
  when "�l�̌ܓ�"
    eq_min, eq_max = true, false
  when "�؂�グ"
    eq_min, eq_max = false, true
  when "�؂�̂�"
    eq_min, eq_max = true, false
  end

  return min, eq_min, max, eq_max
end

def join_answer(min, eq_min, max, eq_max)
  return "�Ȃ�" if min == Float::INFINITY
  answer = ""
  min = (/(\d+\.??\d*?)\.?0*\z/.match(min.to_f.to_s))[1]
  answer += min
  if eq_min
    answer += "�ȏ�"
  else
    answer += "���傫��"
  end
  max = (/(\d+\.??\d*?)\.?0*\z/.match(max.to_f.to_s))[1]
  answer += max
  if eq_max
    answer += "�ȉ�"
  else
    answer += "����"
  end
  return answer
end

def calc(x, figure1, round1, scale, figure2, round2)
  x = BigDecimal(x.to_s) * BigDecimal("10") ** (figure1 - 1)
  case round1
  when "�l�̌ܓ�"
    x = x.round
  when "�؂�グ"
    x = x.ceil
  when "�؂�̂�"
    x = x.floor
  end
  x /= BigDecimal("10") ** (figure1 - 1)
  #p x
  x *= BigDecimal(scale.to_s)
  #p x
  x *= BigDecimal("10") ** (figure2 - 1)
  case round2
  when "�l�̌ܓ�"
    x = x.round
  when "�؂�グ"
    x = x.ceil
  when "�؂�̂�"
    x = x.floor
  end
  #p x
  x /= BigDecimal("10") ** (figure2 - 1)
  #p x
  #p x.to_f
  #p answer
  #return true if x.to_f == answer.to_f
  #return false
  return x.to_f
end

#p calc(24.995, 3, "�l�̌ܓ�", 1.7, 1, "�l�̌ܓ�", 42)



#problems = load_problems("data.sjis.txt")

#problems.each do |problem|
#  p problem
#end

wrong_id = []
File.open("data.sjis.txt", "r") do |f|
  while line = f.gets
#puts line
  id, figure1, round1, scale, figure2, round2, x, right_answer = line.strip.split(' ')

  print "#{id} #{x} #{right_answer}\n"
  next if right_answer == "�Ȃ�"
  min = right_answer.to_f
  #print "#{right_answer.rindex(/��|��/, -1)}\n"
  #print "#{right_answer[(right_answer.rindex(/��|��/, -1)+1)..-1]}\n"
  max = right_answer[(right_answer.rindex(/��|��/, -1)+1)..-1].to_f
  #print "#{min} #{max}\n"
  x1 = calc(min, figure1.to_i, round1, scale.to_f, figure2.to_i, round2)
  x2 = calc(max, figure1.to_i, round1, scale.to_f, figure2.to_i, round2)
  print "#{x1} #{x2}\n"
  if x.to_f == x1 || x.to_f == x2
    puts "true"
  else
    wrong_id << id
  end
  
  exit if id == "33"

=begin
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
=end
  end
end
puts wrong_id.join(",")
exit

round = "�l�̌ܓ�"
#round = "�؂�グ"
min, eq_min, max, eq_max = calc_range(42, 1, round)
scale = 1.7
min_min, eq_min, max_min, eq_max = calc_range2(min, max, scale, 3, round)
print "#{min_min},#{max_min}\n"

# �����I������
t1 = Time.now
print "\n"
puts "�����I�������F#{t1}"

# ��������
puts "�������ԁF#{t1 - t0} sec"
