# coding: utf-8

# @Nabetani  鍋谷 武典さんからの数学の問題
# 中学入試から：単位のある計算
# https://codeiq.jp/ace/nabetani_takenori/q1058


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

# ファイルから問題を読み込む
def load_problems(filename)
  problems = File.open(filename, "r"){ |f|
    f.map{ |line| line.strip.split(' ') }
  }
  return problems
end

# 掛け算の文字列を計算する
#  "999*999" という形式
def calc_multi(formula)
  formula = formula.split("*")
  return formula[0].to_i * formula[1].to_i
end

# 単位の文字列を含んだ加減算の文字列を計算する
# 引数
#  formula: 例　"3m20cm -5cm2mm -20cm8mm"
def calc(formula)
  ans = 0
  members = formula.split(" ")
  members.each do |member|
    # 重さは mg 単位に変換
    member.gsub!("mg", "*1 ")
    member.gsub!("kg", "*1000000 ")
    member.gsub!("g", "*1000 ")
    # 長さは mm 単位に変換
    member.gsub!("mm", "*1 ")
    member.gsub!("cm", "*10 ")
    member.gsub!("km", "*1000000 ")
    member.gsub!("m", "*1000 ")
    # 時間は秒単位に変換
    member.gsub!("日", "*86400 ")
    member.gsub!("時間", "*3600 ")
    member.gsub!("分", "*60 ")
    member.gsub!("秒", "*1 ")

    # 一つの項を計算する
    #  member: 例 "-5*10 2*1 "
    if member[0].chr == '-'
      member_arr = member[1..-1].split(' ')
      member_arr.each do |v|
        ans -= calc_multi(v)
      end
    else
      member_arr = member.split(' ')
      member_arr.each do |v|
        ans += calc_multi(v)
      end
    end
  end
  return ans
end  

# 加減算の文字列から、□の項を取り除いた式と、□の項を返す
def except_square_member(formula)
  square_member = ""
  members = formula.split(" ")
  members.each do |member|
    if member.include?("□")
      square_member = member
      break
    end
  end
  members.delete(square_member)
  return members.join(" "), square_member
end

# □の数値を求める
def solve(problem)
  # 項ごとに分けるために、半角スペースを入れる
  problem.gsub!("+", " +")
  problem.gsub!("-", " -")

  left_side, right_side = problem.split("=")

  if left_side.include?("□")
    left_side, square_member = except_square_member(left_side)
  else
    right_side, square_member = except_square_member(right_side)
  end
  # 「□には必ず正の整数が入ります」ということより、差の絶対値を取る
  ans = (calc(left_side) - calc(right_side)).abs

  # 単位変換
  # ans 重さ：mg単位、長さ：mm単位、時間：秒単位
  #   => □の項の単位
  # □の項の単位の文字列
  unit = square_member[square_member.index("□")+1..-1]
  case unit
  when "kg"
    ans /= 1000000
  when "g"
    ans /= 1000
  when "km"
    ans /= 1000000
  when "m"
    ans /= 1000
  when "cm"
    ans /= 10
  when "日"
    ans /= 86400
  when "時間"
    ans /= 3600
  when "分"
    ans /= 60
  end

  return ans
end


problems = load_problems("data.utf8.txt")

wrong_id =[]
problems.each do |problem|
  if solve(problem[1]) != solve(problem[2])
    wrong_id << problem[0]
  end
end
puts wrong_id.join(",")

# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
