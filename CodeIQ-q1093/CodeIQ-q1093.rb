# CodeIQコード銀行  コードお預かり窓口さんからのウチに来ない？の問題
# コード銀行：切手を切って！
# https://codeiq.jp/ace/code_teller/q1093


# 処理開始時刻
t0 = Time.now
puts "処理開始時刻：#{t0}"
print "\n"

def load_problems(filename)
  problems = []
  #filename = "./stamp/sample.in.txt"
  File.open(filename, "r") do |f|
    n = f.gets.strip.to_i
    #p n
    n.times do
      problems << f.gets.strip.split(" ").map(&:to_i)
    end
  end
  #p problems
  return problems
end

def display(stamp)
  (0...@height).each do |y|
    (0...@width).each do |x|
      if stamp[x + @width * y] == 0
        print " "
      else
        print "X"
      end
    end
    print "\n"
  end
end


def search(stamp, x, y)
  stamp_next = stamp.clone
  stamp_next[x + @width * y] = 1
  if stamp_next.count(1) == @num
    #display(stamp_next)
    @stamp_set << stamp_next
    return
  end
  [[1, 0], [0, -1], [-1, 0], [0, 1]].each do |dir|
    dx = dir[0]
    dy = dir[1]
    x_next = x + dx
    y_next = y + dy
    next if x_next < 0 || x_next >= @width || y_next < 0 || y_next >= @height
    next if stamp_next[x_next + @width * y_next] == 1
    #print "#{x_next}, #{y_next}\n"
    search(stamp_next, x_next, y_next)
  end
end

def write_answers(filename, answers)
  File.open(filename, "w") do |f|
    answers.each do |answer|
      f.write(answer.to_s + "\n")
    end
  end
end

#problems = load_problems("./stamp/sample.in.txt")
problems = load_problems("./stamp/testdata.in.txt")
answers = []

problems.each do |problem|
  #problem = problems[0]
  @height, @width, @num = problem[0], problem[1], problem[2]

  stamp = Array.new(@height * @width, 0)
  #p stamp
  #display(stamp)

  #x, y = 0, 0


  #@stamp_set = [stamp]
  @stamp_set = []
  (0...@height).each do |y|
    (0...@width).each do |x|
      search(stamp, x, y)
    end
  end
  answers << @stamp_set.uniq.length
end

puts answers.join("\n")
write_answers("sample.out.txt", answers)

# 処理終了時刻
t1 = Time.now
print "\n"
puts "処理終了時刻：#{t1}"

# 処理時間
puts "処理時間：#{t1 - t0} sec"
