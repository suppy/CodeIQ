# coding: utf-8

# @Nabetani  鍋谷 武典さんからの数学の問題
# 中学入試から：単位のある計算
# https://codeiq.jp/ace/nabetani_takenori/q1058


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"


def time_unit_convert(time)
  #print time
  time = time.split("*")
  #p time[0].to_i * time[1].to_i
  return time[0].to_i * time[1].to_i
end

def calc(problem)
  ans = 0
  problem_arr = problem.split(" ")
  problem_arr.each do |value|

    value.gsub!("mg", " ")
    value.gsub!("kg", "000000 ")
    value.gsub!("g", "000 ")

    value.gsub!("mm", " ")
    value.gsub!("cm", "0 ")
    value.gsub!("km", "000000 ")
    value.gsub!("m", "000 ")

    value.gsub!("日", "*86400 ")
    value.gsub!("時間", "*3600 ")
    value.gsub!("分", "*60 ")
    value.gsub!("秒", " ")
#p value[0]
#p value[1..-1]
#p '-'.to_i
    #print value
    if value[0].chr == '-'
      value_arr = value[1..-1].split(' ')
  #    p value_arr
      value_arr.each do |v|
        #p v
        v = time_unit_convert(v) if v.include?("*")
        ans -= v.to_i
      end
    else
      value_arr = value.split(' ')
      value_arr.each do |v|
        #p v
        v = time_unit_convert(v) if v.include?("*")
        ans += v.to_i
      end
    end
  end
  #print "ans=#{ans}\n"
  return ans
end  

def except_square(problem)
  square = ""
  problem_arr = problem.split(" ")
  problem_arr.each do |value|
    if value.include?("□")
      square = value
      break
    end
  end
  problem_arr.delete(square)
  return problem_arr.join(" "), square
end
  
def solve(problem)
  problem.gsub!("+", " +")
  problem.gsub!("-", " -")
  #problem[1].gsub!("=", " =")
  problem_l, problem_r = problem.split("=")

  if problem_l.include?("□")
    problem_l, square = except_square(problem_l)
    ans_l = calc(problem_l)
    ans_r = calc(problem_r)
    #print "square : #{square}\n"
    #p square.include?("-")
    if square[0].chr == '-'
      ans = ans_l - ans_r
    else
      ans = ans_r - ans_l
    end
    
  else
    ans_l = calc(problem_l)
    problem_r, square = except_square(problem_r)
    ans_r = calc(problem_r)
    if square[0].chr == '-'
      ans = ans_r - ans_l
    else
      ans = ans_l - ans_r
    end
  end
  
  unit = square[square.index("□")+1..-1]
  #p unit
  case unit
  when "km"
    ans /= 1000000
  when "m"
    ans /= 1000
  when "cm"
    ans /= 10
  when "kg"
    ans /= 1000000
  when "g"
    ans /= 1000
  when "日"
    ans /= 86400
  when "時間"
    ans /= 3600
  when "分"
    ans /= 60
  end
  
  #p ans  
  return ans
end

problems = File.open("data.utf8.txt", "r"){ |f|
	f.map{ |line| line.strip.split(' ') }
}

#p problems
#problem = problems[0]
#p problem

wrong_id =[]

#(0..40).each do |i|
problems.each do |problem|
#  problem = problems[i]
#  p problem
  if solve(problem[1]) == solve(problem[2])
    #print "#{problem[0]}:true\n"
  else
    #print "#{problem[0]}:false\n"
    wrong_id << problem[0]
  end
  #p solve(problem[2])
end
puts wrong_id.join(",") 
exit

problem1 = problem[1].split(' ')
p problem1
  
#puts value.split(' ')
ans = 0
problem[1].split(' ').each do |value|
  puts value
  if !value.include?("□") || value[0] != "="
    p value.to_i
    ans += value.to_i
  end
end
p ans

# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
