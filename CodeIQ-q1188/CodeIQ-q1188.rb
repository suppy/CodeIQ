# @Nabetani  鍋谷 武典さんからの数学の問題
# 中学入試から：図形と場合の数
# https://codeiq.jp/ace/nabetani_takenori/q1188


# 処理開始時刻
t0 = Time.now
#puts "処理開始時刻：#{t0}"
#print "\n"





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
  vertex_num = problem[1].to_i
  vertexes = problem[2].split(",")
  answer = problem[3].to_i

  patterns = []
  triangles = vertexes.combination(3).to_a
  triangles.each do |triangle|
    # 隣の頂点との距離（2つの頂点で挟まれる等分された円弧の数）を求める
    # 3つの距離の組（順番を考慮する）をpatternに格納する
    # 頂点がアルファベットの文字で表されているので、ASCIIコードを利用する
    pattern = []
    (0...2).each do |i|
      pattern << (triangle[i+1].ord - triangle[i].ord) % vertex_num
    end
    pattern << (triangle[0].ord - triangle[2].ord + vertex_num) % vertex_num
    # pattarnの先頭が最小値になるように距離の組のローテーションを行う
    # これにより、同じパターンにそろえることができる
    min = pattern.min
    while pattern.uniq.length != 1 && (pattern[0] != min || pattern[-1] == min)
      pattern = pattern[1..-1] + [pattern[0]]  
    end
    patterns << pattern
  end
  if answer != patterns.uniq.length
    wrong_id << id
  end
end

puts wrong_id.join(",")


# 処理終了時刻
t1 = Time.now
#print "\n"
#puts "処理終了時刻：#{t1}"

# 処理時間
#puts "処理時間：#{t1 - t0} sec"
