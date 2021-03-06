# @yabuki  矢吹 太朗さんからの組合せ最適化の問題
# 最短経路を探そう
# https://codeiq.jp/ace/yabuki_taro/q1103


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

require 'bigdecimal'

def solve(points)
  min_dis = BigDecimal("-1")
  min_route = []
  # すべての経路について計算を行う
  (1..points.length-1).to_a.permutation(points.length-1).to_a.each do |route|
    # スタート地点を設定する
    route.unshift(0)
    # 最短巡回路を見つける
    # ただし、経路長を計算するときに、Math.sqrt を使用すると Float になってしまうので、
    # BigDecimal で計算できるように、平方の和が最小になる巡回路を見つける
    dis = BigDecimal("0")
    (0...route.length-1).each do |i|
      dis += (BigDecimal(points[route[i]][0].to_s) - BigDecimal(points[route[i+1]][0]))**2 + (BigDecimal(points[route[i]][1]) - BigDecimal(points[route[i+1]][1]))**2
    end
    dis += (BigDecimal(points[route[route.length-1]][0]) - BigDecimal(points[route[0]][0]))**2 + (BigDecimal(points[route[route.length-1]][1]) - BigDecimal(points[route[0]][1]))**2
    if min_dis == -1 || min_dis > dis
      min_dis = dis
      min_route = route
    end
  end

  # 最短巡回路の経路長を計算
  route = min_route
  dis = BigDecimal("0")
  (0...route.length-1).each do |i|
    dis += Math.sqrt((BigDecimal(points[route[i]][0].to_s) - BigDecimal(points[route[i+1]][0]))**2 + (BigDecimal(points[route[i]][1]) - BigDecimal(points[route[i+1]][1]))**2)
  end
  dis += Math.sqrt((BigDecimal(points[route[route.length-1]][0]) - BigDecimal(points[route[0]][0]))**2 + (BigDecimal(points[route[route.length-1]][1]) - BigDecimal(points[route[0]][1]))**2)

  # 解答を出力
  print "{{"
  (0...route.length).each do |i|
    print "#{route[i]+1},"
  end
  print "1},#{dis}}\n"

end

=begin
points = [[4, 5], [7, 2], [9, 1], [9, 4], [7, 3], [6, 8]]
solve(points)
=end

points = [[6, 2], [4, 6], [3, 4], [6, 7]]
solve(points)

points = [[9007199254742147, 18014398509481729],
 [12756043757992973, 9682416912451847],
 [7757599369284503, 13555003989651347],
 [6644379103590211, 16459957280325781],
 [7107267045169859, 11361149298161843],
 [17193260969299, 17215263416918057],
 [374711875842439, 13679925148827797],
 [9007199254742149, 18014398509481727]]
solve(points)

points = [[24450478250354407, 24162405956350007],
 [5022777106905113, 9351872806120363],
 [22646143480201399, 18046391278629037],
 [26904592918639433, 8822422244422001],
 [13510798882112671, 27021597764225159],
 [7416604674633347, 17884308649058737],
 [11322174193520947, 3885286011386431],
 [25871043906094921, 9505143934995377],
 [12509125559334347, 10427194051934741],
 [13510798882112669, 27021597764225161]]
solve(points)

points = [[143440002785145229, 125304038892333277],
 [264428432131034503, 120015772829769617],
 [128790875003948837, 270669230395068511],
 [159528435868345829, 204968426098505873],
 [19849988012900029, 184555790037852601],
 [275289191011264097, 71741794408943803],
 [10351044942542977, 120950333572309643],
 [256393278357970813, 144044348649819451],
 [144115188075856001, 288230376151712791],
 [144115188075856003, 288230376151712789],
 [219455401629103741, 10320154786742321],
 [227161482167126027, 70606670735479337]]
solve(points)



# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
