# @cielavenir  cielさんからの生命情報学の問題
# Color Spaceを変換しよう
# https://codeiq.jp/ace/cielavenir/q1041


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

# Color Spaceは、隣接する2塩基と次のように対応します(行=1文字目、列=2文字目)
#
# 塩基	A	C	G	T
#     A	0	1	2	3
#     C	1	0	3	2
#     G	2	3	0	1
#     T	3	2	1	0

color_space = { ["A", "A"] => 0, ["A", "C"] => 1, ["A", "G"] => 2, ["A", "T"] => 3,
                ["C", "A"] => 1, ["C", "C"] => 0, ["C", "G"] => 3, ["C", "T"] => 2,
                ["G", "A"] => 2, ["G", "C"] => 3, ["G", "G"] => 0, ["G", "T"] => 1,
                ["T", "A"] => 3, ["T", "C"] => 2, ["T", "G"] => 1, ["T", "T"] => 0,
              }

File.open("data.in", "r") do |fr|
  File.open("data.out", "w") do |fw|
    while problem_no = fr.gets
      fw.puts problem_no.split
      cs_string = fr.gets.strip
      bs_string = cs_string[0]
      (1...cs_string.length).each do |i|
        cs = cs_string[i, 1].to_i
        bs_string += (color_space.find {|key, value| value == cs && key[0] == bs_string[i-1]}[0])[1]
      end
      fw.puts bs_string
    end
  end
end

               
# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
