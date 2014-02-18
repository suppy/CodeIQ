# 点数を初期化
max_point = 0

blendlist = []

# ファイルからすべてのblendを読み込む
# blendlistに格納する
open("blendlist.txt") {|file|
  while l = file.gets
    l.chop! # "\n" を取り除く
    spice = l.split(" ")
    blendlist.push([spice[0], spice[1]])
  end
}

# blendlistに含まれるspiceの数
 p blendlist.flatten.uniq.sort.size

# すべてのspiceをspicelistに格納する（重複なし、ソート済み）
spicelist = blendlist.flatten.uniq.sort

n = 2 ** spicelist.size
p n
for i in (0..n) do
end
exit

while(true) do

  dish1 = []
  dish2 = []
  point = 0

  # blendlistをシャッフル
  blendlist_shuffle = blendlist.sort_by { rand }
  # p blendlist_shuffle

  # 選択するblendの個数を乱数で設定（1～blendの個数-1）
  # ２皿目が０にならないようにするため、blendの個数-1まで
  blend_num = rand(blendlist.size - 1) + 1
  # p blend_num

  # blendlistの先頭から個数分だけ取り出す
  # → １皿目のblend
  1.upto(blend_num) do
    dish1.push(blendlist_shuffle.shift)
  end

  # p dish1
 
  # １皿目で使用したspice（重複なし、ソート済み）
  spice1 = dish1.flatten.uniq.sort

  # print "spice1:"
  # p spice1

  # １皿目で使用したspiceを削除する
  # → ２皿目で使用できるspice
  spice2 = spicelist - spice1

  # print "spice2:"
  # p spice2

  # 残ったblendlistから使用したspiceのblendを削除する
  # → ２皿目のblend
  dish2 = blendlist_shuffle
  spice1.each do |spice|
    dish2.delete_if { |blend| (blend[0] === spice) || (blend[1] === spice) }
  end

  # print "dish1"
  # p dish1
  # print "dish2"
  # p dish2

  # ２番目の皿のblendが０だったら無効
  next if dish2.size === 0

  # 点数を計算する
  point = dish1.size + dish2.size
  # print "point:"
  # p point

  # 点数が最大値かどうかの判定
  if point > max_point then
    # 最大値を書き換え
    max_point = point
    print "max_point:"
    p max_point

    # blendの数が多い方を回答にする
    if dish1.size > dish2.size then
      spice_ans = spice1
    else
      spice_ans = spice2
    end

    # 回答のspiceをファイルに書き込む
    file = File.open("curry-result.txt",'w')
    spice_ans.each { |spice|
      file.print spice + " "
    }
    file.print "\n"
    # pointの最大値を書き込む
    file.puts max_point
    file.close
  end

end
