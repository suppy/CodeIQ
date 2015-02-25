# coding:utf-8
# Short Coder @ozy4dm  Ozyさんからの言語不問の問題
# わんにゃんキャッスル
# https://codeiq.jp/ace/ozy4dm/q1022
 
 
# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"
 
#@map_size = 8
#@map = File.open("./wan_nyan/map8.txt", "r") {|f| f.read}
#@map_size = 100
#@map = File.open("./wan_nyan/map100.txt", "r") {|f| f.read}
#@map_size = 1000
#@map = File.open("./wan_nyan/map1000.txt", "r") {|f| f.read}
@map_size = 300
@map = File.open("./wan_nyan_testdata/map300.txt", "r") {|f| f.read}
@map_size = 400
@map = File.open("./wan_nyan_testdata/map400.txt", "r") {|f| f.read}
@map_size = 500
@map = File.open("./wan_nyan_testdata/map500.txt", "r") {|f| f.read}
@map_size = 1000
@map = File.open("./wan_nyan_testdata/map1000.txt", "r") {|f| f.read}

=begin
@map = ""
@map_size = 0
while line = gets
	@map += line.strip
	@map_size = line.strip.length
end
=end
 
@map = @map.gsub(/W/, "0").gsub(/N/, "1").gsub(/\n/, "")
 
max = [1, 1]
(0...(@map_size-1)).each do |y|
  break if y + max.min > @map_size
  (0...(@map_size-1)).each do |x|
    wan_nyan = @map[x + y * @map_size].to_i
    break if x + max[wan_nyan] > @map_size
    # (x, y)を左上の頂点とする正方形のサイズの最大値を求める
    count = 1
    (2..@map_size).each do |n|
      break if x + n > @map_size || y + n > @map_size
      # 右隣りの列
      (y...(y+n)).each do |j|
        break if wan_nyan != @map[(x + n - 1) + j * @map_size].to_i
        count += 1
      end
      # 一段下の列
      (x...(x+n)).each do |i|
        break if wan_nyan != @map[i + (y + n - 1) * @map_size].to_i
        count += 1
      end
      # 右下は重複して数えているので１減らす
      count -= 1 if wan_nyan == @map[(x + n - 1) + (y + n - 1) * @map_size].to_i
      break if count != n * n
      if n > max[wan_nyan]
        max[wan_nyan] = n
        #print "#{x},#{y}:#{max[wan_nyan]}*#{max[wan_nyan]} #{wan_nyan} #{max}\n"
      end
    end
  end  
end
print "W: #{max[0]}\n"
print "N: #{max[1]}\n"    



# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"

exit
 
@map_size.times do |y|
  @map_size.times do |x|
    pet = @map[y][x]
    max_castle_size = [@map_size - x, @map_size - y].min
    #print "(#{x},#{y}) #{max_castle_size}\n"
    max_castle_size_x = max_castle_size
    max_castle_size_y = 0
    max_castle_size.times do |dy|
      if max_castle_size_y != 0
        break
      end
      if dy > max_castle_size_x 
        max_castle_size_y = max_castle_size_x
        break
      end
      (max_castle_size+1).times do |dx|
        if x + dx -1>= @map_size
          max_castle_size_x = dx
          break
        end
        break if dx >= max_castle_size_x
        if pet == @map[y + dy][x + dx]
          next
        end
        #break if dx == 0
        #print "#{@map[y + dy][x + dx]}"
        if dx != 0
          max_castle_size_x = dx
          #break
        else
          max_castle_size_y = dy
        end
        #print "(#{x},#{y})->(#{x + dx},#{y + dy}) #{max_castle_size_x}\n"
        
        break
      end
      #print "\n"
      
    end
    #print "\n"
    print "(#{x},#{y}) #{max_castle_size_x},#{max_castle_size_y}\n"
  end
end

exit



=begin

    dx_min, dy_min = @map_size - x, @map_size - y
    castle_x_size = @map_size - x
    castle_y_size = @map_size - y
    next_castle_x_size = castle_x_size
    next_castle_y_size = castle_y_size
    (0..castle_y_size).each do |dy|
      if dy >= castle_x_size
        #next_castle_y_size = dy
        break
      end
      #print "castle_size:#{castle_x_size},#{castle_y_size}\n"
      (0..castle_x_size).each do |dx|
        if x + dx >= @map_size || y + dy >= @map_size
          break
        end
        #print "#{x+dx},#{y+dy} #{@map[y + dy][x + dx]}\n"
        if pet == @map[y + dy][x + dx]
          next
        end
        if pet != @map[y + dy][x + dx] && dy != 0 && dx == 0
          next_castle_y_size = dy
          break
        end
        if pet != @map[y + dy][x + dx] && dy != 0 && dx != 0
          next_castle_y_size = dy
          print "dx=#{dx}\n"
          next_castle_x_size = dx
          break
        end
        if pet != @map[y + dy][x + dx] && dx != 0
          print "dx=#{dx}\n"
          next_castle_x_size = dx
          break
        end
      end
      if next_castle_y_size != castle_y_size
        break
      end
      castle_x_size = next_castle_x_size
    end
    #print "#{pet} #{x+dx},#{y+dy}\n"
    castle_size = [castle_x_size, next_castle_y_size].min
    print "result #{x},#{y} #{castle_x_size},#{next_castle_y_size}  answer #{castle_size}\n"
  end
end
 
=end 
 
# 処理終了時刻
t1 = Time.now
print "\n"
