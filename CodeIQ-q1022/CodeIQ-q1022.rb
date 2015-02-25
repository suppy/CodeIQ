# coding:utf-8
# Short Coder @ozy4dm  Ozyさんからの言語不問の問題
# わんにゃんキャッスル
# https://codeiq.jp/ace/ozy4dm/q1022
 
 
# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"
 
@map_size = 8
 
@map = "
WNWNWWNW
NWNWNWWW
NWWNNWWN
WWWNWNNW
WNNNWNNW
WNNNNWNW
NNNNNWWW
WWWNWWWN
"
 
p @map
 
@map = @map.strip.gsub(/W/, "0").gsub(/N/, "1").split("\n").map {|s|s.split('')}
 
p @map
 
@map_size.times do |y|
  @map_size.times do |x|
    print @map[y][x]
  end
  print "\n"
end
 
@map_size.times do |y|
  @map_size.times do |x|
    #exit if y == 2
    pet = @map[y][x]
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
 
 
 
# 処理終了時刻
t1 = Time.now
print "\n"
