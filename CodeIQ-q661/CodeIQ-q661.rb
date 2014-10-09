# 増井技術士事務所  今週のアルゴリズムの@masuipeoさんからのアルゴリズムの問題
# 今週のお題：最長の移動経路を考えて！
# https://codeiq.jp/ace/thisweek_masuipeo/q661


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

@n = 2

@height = 5
@width  = 6

@max_length = 0

x = 0
y = 0
pos = [x, y]
use_path = []

=begin
dirs = [[1, 0], [0, -1], [-1, 0],[0, 1]]
2.times do
dirs.each do |dir|
  pos_next = []
  pos_next[0] = pos[0] + dir[0]
  pos_next[1] = pos[1] + dir[1]
  next if pos_next[0] < 0 || pos_next[0] >= @width || pos_next[1] < 0 || pos_next[1] >= @height
  p pos
  p pos_next
  p [pos, pos_next]
  use_path << [pos, pos_next].sort
end
pos = 
end
p use_path


exit
=end

# マス目を表す配列
field = Array.new(@height+1){Array.new(@width+1){0}}
p field
#field += Array.new(width+1){Array.new(height){0}}
p field
#field[0][0] = 1
#p field
#field = Array.new((height+1) * (width+1), 0)
#field = Array.new(@width * (@height+1) + @height * (@width+1), 0)
#p field
#p field.length

=begin
field = [[1, 0, 0, 0, 1],
         [0, 1, 0, 0, 0],
         [1, 1, 0, 0, 0],
         [1, 1, 0, 0, 0]]
=end

pos = 0

def is_n_times(pos, field)
  num = 0
  if pos % (2*@width+1) >= @width && pos % (2*@width+1) <= 2*@width
    (0...@height).each do |y|
      num += field[pos % (2*@width+1) + (2*@width+1)*y]
    end
  else
    (0...@width).each do |x|
      #p (pos / (2*@width+1)).floor * (2*@width+1) + x
      num += field[(pos / (2*@width+1)).floor * (2*@width+1) + x]
    end
  end
  return false if num >= @n
  return true
end

def move(pos, dir, path, field)
if pos == field.length - 1 or pos == field.length - @width - 1
  puts "goal"
  p path
  print "path_length:#{path.length}\n"
  if @max_length < path.length
    @max_length = path.length
    @max_path = path
  end
  return
end
move_dir = [0, 0, 1, 1]
up_move = [-@width, -2 * @width - 1, -@width - 1, 0]
down_move = [@width+1, 0, @width, 2 * @width+1]
right_move = [1, -@width, 0, @width + 1]
left_move = [0, -@width-1, -1, @width]
horizontal = [right_move, left_move]
vertical = [up_move, down_move]
#dir = 1
#pos = 18
print "pos=#{pos}\n"
print "dir=#{dir}\n"
if pos % (2*@width+1) >= @width && pos % (2*@width+1) <= 2*@width
  (0..3).each do |j|
    i = vertical[dir][j]
    next if pos % (2*@width+1) == 2*@width && dir == 0 && pos - @width == pos + i
    next if pos % (2*@width+1) == @width && dir == 0 && pos - @width -1 == pos + i
    next if pos % (2*@width+1) == 2*@width && dir == 1 && pos + @width +1 == pos + i
    next if pos % (2*@width+1) == @width && dir == 1 && pos + @width == pos + i
    next_pos = pos + i
    next if next_pos < 0 || next_pos >= field.length 
    next_dir = move_dir[j]
    #print "pos=#{next_pos}, dir=#{next_dir}\n"
    next if !is_n_times(next_pos, field)
    next_field = field.clone
    next_field[next_pos] += 1
    next_path = path.clone.push(next_pos)
    move(next_pos, next_dir, next_path, next_field)
  end
else
  (0..3).each do |j|
    i = horizontal[dir][j]
    next if pos % (2*@width+1) == @width-1 && dir == 0 && pos + 1 == pos + i
    next if pos % (2*@width+1) == 0 && dir == 1 && pos - 1 == pos + i
    next_pos = pos + i 
    next if next_pos < 0 || next_pos >= field.length 
    next_dir = move_dir[j]
    #print "pos=#{next_pos}, dir=#{next_dir}\n"
    next if !is_n_times(next_pos, field)
    next_field = field.clone
    next_field[next_pos] += 1
    next_path = path.clone.push(next_pos)
    move(next_pos, next_dir, next_path, next_field)
  end
end
end

field = Array.new(@width * (@height+1) + @height * (@width+1), 0)
path = [0]
field[0] = 1
move(path[0], 0, path, field)

field = Array.new(@width * (@height+1) + @height * (@width+1), 0)
path = [@width]
field[@width] = 1
move(path[0], 1, path, field)

p @max_length
p @max_path

exit

def display_field(field)
  field.each do |field_y|
    field_y.each do |field_x|
      print field_x
    end
    print "\n"
  end
  print "\n"
end




@field = [ 1, 0, 0, 0,
          1, 0, 1, 0, 0,
           0, 1, 1, 1,
          0, 0, 1, 1, 0,
           0, 0, 0, 0,
          1, 0, 1, 1, 0,
           0, 0, 0, 0]
         

#display_field(field)
p is_n_times(22)

=begin
def move(field, pos)
  [[1, 0], [0, -1], [-1, 0], [0, 1]].each do |dir|
    field_next = Marshal.load(Marshal.dump(field)); # deep copy
    pos_x_next = dir[0] + pos[0]
    pos_y_next = dir[1] + pos[1]
    next if pos_x_next < 0 || pos_x_next >= @width || pos_y_next < 0 || pos_y_next >= @height
    field_next[pos_y_next][pos_x_next] += 1
    puts "field_next"
    display_field(field_next)
    return if is_n_times(field_next, [pos_x_next, pos_y_next])
    move(field_next, [pos_x_next, pos_y_next]) 
  end
end
=end

#p [0, 1].repeated_permutation((height+1)*(width+1)).to_a.length



#pos = [0, 0]
#move(field, pos)


# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
