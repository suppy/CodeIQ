# @Nabetani  鍋谷 武典さんからの数学の問題
# 中学入試から：正三角形？二等辺？
# https://codeiq.jp/ace/nabetani_takenori/q1097


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


# 三角形の判定
# 　あ）正三角形である。
#　　い）二等辺三角形である。（ただし、正三角形であるとはいえない。）
#　　う）二等辺三角形ではない。または、二等辺三角形かどうかわからない。
def judge_triangle(sides, angles)

  answers = ["あ", "い", "う"]

  #　う）二等辺三角形ではない。または、二等辺三角形かどうかわからない。
  answer = answers[2]

  #　い）二等辺三角形である。（ただし、正三角形であるとはいえない。）
  #  二辺の長さが等しい
  answer = answers[1] if sides.length != sides.uniq.length
  #  二角が等しい
  answer = answers[1] if angles.length != angles.uniq.length

  # あ）正三角形である。
  #  三辺の長さが等しい
  answer = answers[0] if sides.length == 3 && sides.uniq.length == 1
  #  二角が60度
  answer = answers[0] if angles.count(60) >= 2
  #  二辺の長さが等しく、一角が60度
  answer = answers[0] if sides.length == 2 && sides.uniq.length == 1 && angles.include?(60)

  return answer
end


problems = load_problems("data.utf8.txt")

wrong_data_id = []
problems.each do |problem|
  # データID、空欄Aの内容、空欄Aの内容に対応した答え
  data_id, condition, answer = problem[0], problem[1], problem[2]
  # 空欄Aの内容から、長さの数値を取り出し、配列に格納する
  sides = condition.scan(/(\d+)cm/).flatten.collect{|item| item.to_i()}
  # 空欄Aの内容から、角度の数値を取り出し、配列に格納する
  angles = condition.scan(/(\d+)度/).flatten.collect{|item| item.to_i()}
  # 角度の数値が2つであれば、残りの角度を求め、配列に格納する
  angles << 180 - angles[0] - angles[1] if angles.length == 2

  # 空欄Aの内容に対応した答えになっていないとき
  if answer != judge_triangle(sides, angles)
    wrong_data_id << data_id
  end
end
# 結果の出力
puts wrong_data_id.join(",")


# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
