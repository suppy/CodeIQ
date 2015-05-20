# Ruby
# answer 104

triangles = File.open("codeiq_mid.triangles.csv", "r") do |f|
  f.read
end

triangle_num = triangles.split("\n").length
point = []
triangles.split("\n").map do |triangle|
  point << triangle.split(",").map {|p| p.to_i}
end
point_num = point.flatten.uniq.length

ans = 2 * point_num - 2 - triangle_num
p ans

