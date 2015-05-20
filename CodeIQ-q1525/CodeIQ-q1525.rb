# stakemura   @stakemuraさんからの問題
# キュラゲの辺の数を求めよう
# https://codeiq.jp/q/1525


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

triangles = File.open("codeiq_mid.triangles.csv", "r") do |f|
  f.read
end

triangle_num = triangles.split("\n").length
point = []
triangles.split("\n").map do |triangle|
  point << triangle.split(",").map {|p| p.to_i}
end

point_num = point.flatten.uniq.length
#p point.flatten.uniq.sort

#point_num = point.flatten.max + 1 # 頂点番号は0番からなので、1を加算
#p point_num

ans = 2 * point_num - 2 - triangle_num
p ans

# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
