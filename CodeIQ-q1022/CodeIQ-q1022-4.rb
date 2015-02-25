# coding:utf-8
# Short Coder @ozy4dm  Ozyさんからの言語不問の問題
# わんにゃんキャッスル
# https://codeiq.jp/ace/ozy4dm/q1022
 
 
# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"
 
 
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
@map_size = 8
@map = File.open("./wan_nyan/map8.txt", "r") {|f| f.read}
@map_size = 100
@map = File.open("./wan_nyan/map100.txt", "r") {|f| f.read}
@map_size = 1000
@map = File.open("./wan_nyan/map1000.txt", "r") {|f| f.read}
 
#p @map
 
#@map = @map.strip.gsub(/W/, "0").gsub(/N/, "1").split("\n").map {|s|s.split('')}
@map = @map.gsub(/W/, "0").gsub(/N/, "1").gsub(/\n/, "")
#@map = @map.strip.gsub(/W/, "0").gsub(/N/, "1")
 
#p @map.to_i(2).length

def display(map) 
  @map_size.times do |y|
    @map_size.times do |x|
      print map[x + y * @map_size]
    end
    print "\n"
  end
end

def make_mask(x, y, n, pet)
  mask = (1 - pet).to_s * @map_size * @map_size
  if x < 0 || x >= @map_size || y < 0 || y >= @map_size
    return mask
  end
  if x + n > @map_size || y + n > @map_size
    return mask
  end
  
  (y...y + n).each do |j|
    break if j >= @map_size
    (x...x + n).each do |i|
      break if i >= @map_size
      mask[i + j * @map_size] = pet.to_s
    end
  end
  return mask
end

#display(@map)
#mask = make_mask(1, 4, 2, 1)
#display(mask)

#p (@map.to_i(2) & mask.to_i(2)).to_s(2).count("1") == 2 * 2

def invert(map)
  (@map_size * @map_size).times do |i|
    map[i] = (1 - map[i].to_i).to_s
  end
  return map
end

#p @map
#p invert(@map)

max = [1, 1]
#max_n = 1
(0...(@map_size-1)).each do |y|
  #exit if y == 1
  break if y + max.min > @map_size
  (0...(@map_size-1)).each do |x|
    pet = @map[x + y * @map_size].to_i
    break if x + max[pet] > @map_size
    #print "#{x},#{y} pet:#{pet}\n"
    #next if pet == 0
    count = 1
    (2..@map_size).each do |n|
      break if x + n > @map_size || y + n > @map_size
=begin
      (y...(y+n)).each do |j|
        (x...(x+n)).each do |i|
          print @map[i + j * @map_size].to_i
        end
        print "\n"
      end
=end        
      (y...(y+n)).each do |j|
        #print @map[(x + 1) + j * @map_size].to_i
        break if pet != @map[(x + n - 1) + j * @map_size].to_i
        count += 1
      end
      #print "y #{x},#{y} #{count}\n"
      (x...(x+n)).each do |i|
        #print @map[i + (y + 1) * @map_size].to_i
        break if pet != @map[i + (y + n - 1) * @map_size].to_i
        count += 1
      end
      #print "x #{x},#{y} #{count}\n"
      count -= 1
      #print "#{x},#{y} #{count}\n"
      break if count != n * n
=begin
      ((y+1)...y + n).each do |j|
        ((x+1)...x + n).each do |i|
#            break if @map[i + j * @map_size] != mask[i + j * @map_size]
          break if @map[i + j * @map_size] != pet.to_s
          count += 1
        end
        break if count != n * (j - y + 1)
      end
      break if count != n * n
=end
      #print "#{x},#{y}:#{n}*#{n}\n"
      if n > max[pet]
        max[pet] = n
        print "#{x},#{y}:#{max[pet]}*#{max[pet]} #{pet} #{max}\n"
      end
    end
  end  
end
p max
#max << max_n
#invert(@map)
p max
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
